require "open3"

def exist?(path)
  stdio, stderr, proccess = Open3.capture3("ls #{path}")
  stderr.empty?
end

def get_os_bit
  bit, stderr, proccess = Open3.capture3('uname -m')
  bit
end

def get_os_distribution
  # Check Ubuntu or Debian
  if exist?("/etc/debian_version") || exist?("/etc/debian_release")
    # Ubuntu
    return "ubuntu" if exist?("/etc/lsb-release")
    # Debian
    return "debian"
  # Fedra
  elsif exist?("/etc/fedora-release")
    return "fedora"
  elsif exist?("/etc/redhat-release")
    # Oracle Linux
    if exist?("/etc/oracle-release")
      return "oracle"
    # CentOS 
    elsif exist?("/etc/centos-release")
      return "centos"
    # Red Hat Enterprise Linux
    else 
      return "redhat"
    end
  # Arch Linux
  elsif exist?("/etc/arch-release")
    return "arch"
  # Turbolinux
  elsif exist?("/etc/turbolinux-release")
    return "turbol"
  # SuSE Linux
  elsif exist?("/etc/SuSE-release")
    return "suse"
  # Mandriva Linux
  elsif exist?("/etc/mandriva-releas")
    return "mandriva"
  # Vine Linux
  elsif exist?("/etc/vine-release")
    return "vine"
  # Gentoo Linux
  elsif exist?("/etc/gentoo-release")
    return "gentoo"
  # Other
  else 
    puts "unknown distribution"
    return "unknown"
  end
end

def get_os_info
  puts "#{get_os_distribution} #{get_os_bit}"
end

get_os_info