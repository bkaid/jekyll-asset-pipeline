module JekyllAssetPipeline
  class Hasher
    extend JekyllAssetPipeline::SubclassTracking

    def initialize(prefix, type, asset)
      @prefix = prefix
      @type = type
      @asset = asset
    end

    # Update assets file name with hash based on files content.
    def hash
      hash = Digest::MD5.hexdigest(@asset.content)
      @asset.filename = "#{@prefix}-#{hash}#{@type}"
    end
  end
end