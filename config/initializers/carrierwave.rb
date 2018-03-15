CarrierWave.configure do |config|
  if Rails.env.production?                  #这里同样也用条件语句写明了不同环境用什么设置。
    config.fog_provider = 'fog'                  
    config.fog_credentials = {
      provider:              'AWS',                        #这里写明了存储服务的提供商，下面就是各种aws的key
      aws_access_key_id:     ENV["AWS_ACCESS_KEY_ID"],       # 这样写rails就会自动去figaro之前生成的application.yml中去抓对应名称的key和信息
                                                             # 如此这些rb文件被push上去就不会泄露信息
      aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],

      region:                ENV["AWS_REGION"]            # 这个区域如果不清楚就去Amazon上查下建立的储存桶的信息

    }
    config.fog_directory  = ENV["AWS_BUCKET_NAME"]    # 这里写明储存桶的名称


  else                        #这里写明非产品环境就存储在本地。
    config.storage :file
  end
end
