# shellcheck disable=SC2034

os=$(cat "${__global:?}/explorer/os")
init=$(cat "${__global:?}/explorer/init")

ejabberd_start_cmd='ejabberdctl start && ejabberdctl started'
ejabberd_stop_cmd='ejabberdctl status >/dev/null && { ejabberdctl stop; ejabberdctl stopped; } || :'
ejabberd_restart_cmd="${ejabberd_stop_cmd} ; ${ejabberd_start_cmd}"

case ${os}
in
	(debian|devuan|ubuntu)
		# ejabberdctl_cfg_path=/etc/ejabberd/ejabberdctl.cfg
		ejabberdctl_cfg_path=/etc/default/ejabberd
		ejabberd_yml_path=/etc/ejabberd/ejabberd.yml

		data_directory=/var/lib/ejabberd

		service_name=ejabberd

		case ${init}
		in
			(systemd)
				ejabberd_start_cmd="systemctl start ${service_name:?}"
				ejabberd_stop_cmd="systemctl stop ${service_name:?}"
				ejabberd_restart_cmd="systemctl restart ${service_name:?}"
				;;
			(*)
				ejabberd_start_cmd="/etc/init.d/${service_name:?} start"
				ejabberd_stop_cmd="/etc/init.d/${service_name:?} stop"
				ejabberd_restart_cmd="/etc/init.d/${service_name:?} restart"
				;;
		esac
		;;
	(*)
		: "${__type:?}"  # make shellcheck happy
		printf 'Your operating system (%s) is currently not supported by this type (%s)\n' "${os}" "${__type##*/}" >&2
		printf 'Please contribute an implementation for it if you can.\n' >&2
		exit 1
		;;
esac
