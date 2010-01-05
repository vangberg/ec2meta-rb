$:.unshift 'lib'
require 'test/unit'
require 'rr'
require 'ec2meta'

class TestEC2M < Test::Unit::TestCase
  include RR::Adapters::TestUnit

  def setup
  end

  def test_ami_id
    mock(EC2M).get('ami-id') {"ami-32bd12d2"}
    assert_equal "ami-32bd12d2", EC2M.ami_id
  end

  def test_ancestor_ami_ids
    mock(EC2M).get('ancestor-ami-ids') {
      "ami-11111111\nami-23456789\nami-87878787"
    }
    assert_equal %w(ami-11111111 ami-23456789 ami-87878787),
      EC2M.ancestor_ami_ids
  end

  def test_block_device_mapping_unspecified
    mock(EC2M).get('block-device-mapping/') {"ami\nephemeral0\nroot\nswap"}
    assert_equal %w(ami ephemeral0 root swap), EC2M.block_device_mapping
  end

  def test_block_device_mapping_specified
    mock(EC2M).get('block-device-mapping/ami') {"sda1"}
    assert_equal "sda1", EC2M.block_device_mapping('ami')
  end

  def test_availability_zone
    mock(EC2M).get('placement/availability-zone') {"eu-west-1a"}
    assert_equal "eu-west-1a", EC2M.availability_zone
  end
end
