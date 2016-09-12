require 'rong_cloud/configuration'
require 'rong_cloud/connection'

module RongCloud
  # 配置融云 Server 连接信息
  #
  def self.configure(&block)
    yield RongCloud::Configuration
  end
end