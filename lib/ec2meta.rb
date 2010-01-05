require 'net/http'

module EC2M
  VERSION = '0.1'
  API_VERSION = '2009-04-04'

  extend self

  def get name
    path = [API_VERSION, 'meta-data', name].join '/'
    Net::HTTP.get '169.254.169.254', path
  end

  COMMANDS = %w(ami_id ami_launch_index ami_manifest_path hostname
                instance_action instance_id instance_type kernel_id
                local_hostname local_ipv4 public_hostname public_ipv4
                ramdisk_id reservation_id)

  COMMANDS.each do |name|
    define_method(name) {get name.gsub('_', '-')}
  end

  def ancestor_ami_ids
    get('ancestor-ami-ids').split
  end

  def availability_zone
    get 'placement/availability-zone'
  end

  def block_device_mapping device=nil
    if device
      get "block-device-mapping/#{device}"
    else
      get('block-device-mapping/').split
    end
  end

  def public_keys
    raise "Not implemented"
  end
end
