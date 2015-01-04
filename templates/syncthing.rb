Eye.application 'syncthing' do
  working_dir '/config'
  stdall '/var/log/eye/syncthing-stdall.log' # stdout,err logs for processes by default
  trigger :flapping, times: 10, within: 1.minute, retry_in: 3.minutes
  check :cpu, every: 10.seconds, below: 100, times: 3 # global check for all processes

  process :syncthing do
    pid_file '/var/run/syncthing-eye.pid'
    start_command '/sbin/setuser syncthing /syncthing -home /config -gui-authentication="{{ syncthing_user }}:{{ syncthing_password }}" -gui-address="0.0.0.0:8080"'

    daemonize true
    start_timeout 10.seconds
    stop_timeout 5.seconds

  end

end
