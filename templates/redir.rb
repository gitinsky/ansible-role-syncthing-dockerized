Eye.application 'redir' do
  working_dir '/'
  stdall '/var/log/eye/redir-stdall.log' # stdout,err logs for processes by default
  trigger :flapping, times: 10, within: 1.minute, retry_in: 3.minutes
  check :cpu, every: 10.seconds, below: 100, times: 3 # global check for all processes

  process :redir do
    pid_file '/var/run/redir-eye.pid'
    start_command 'redir --lport=8080 --caddr=127.0.0.1 --cport=8080'

    daemonize true
    start_timeout 10.seconds
    stop_timeout 5.seconds

  end

end
