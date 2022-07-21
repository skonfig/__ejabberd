# shellcheck disable=SC2034

os=$(cat "${__global:?}/explorer/os")

case ${os}
in
	(debian|devuan|ubuntu)
		ejabberd_yml_path=/etc/ejabberd/ejabberd.yml

		data_directory=/var/lib/ejabberd

		service_name=ejabberd
		;;
	(*)
		: "${__type:?}"  # make shellcheck happy
		printf "Your operating system (%s) is currently not supported by this type (%s)\n" "${os}" "${__type##*/}" >&2
		printf "Please contribute an implementation for it if you can.\n" >&2
		exit 1
		;;
esac

ejabberd_stop_cmd='ejabberdctl status >/dev/null && { ejabberdctl stop; ejabberdctl stopped; } || :'
ejabberd_start_cmd='ejabberdctl start && ejabberdctl started'
ejabberd_restart_cmd="${ejabberd_stop_cmd} ; ${ejabberd_start_cmd}"
