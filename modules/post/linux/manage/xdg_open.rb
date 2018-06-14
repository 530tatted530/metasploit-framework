##
# This module requires Metasploit: https://metasploit.com/download
# Current source: https://github.com/rapid7/metasploit-framework
##

class MetasploitModule < Msf::Post
  include Msf::Post::Linux::System

  def initialize(info={})
    super( update_info( info,
      'Name'          => 'Linux Admin XDG open',
      'Description'   => %q{
          This module will open any local ressource in the target system via the 'xdg-open' command.
      },
      'License'       => MSF_LICENSE,
      'Author'        => ['DeveloppSoft'],
      'Platform'      => ['linux'],
      'SessionTypes'  => ['shell', 'meterpreter']
    ))

    register_options([
      OptString.new('RES', [true, 'Ressource to open, URL or file.'])
    ])
  end

  def run
    print_status('Starting xdg-open...')
    cmd_exec("xdg-open #{datastore['RES']} > /dev/null")
  end
end
