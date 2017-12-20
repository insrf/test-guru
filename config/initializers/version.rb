module TestGuru
  MAJOR_VERSION = 0
  MINOR_VERSION = 1
  PATCH_VERSION = 1

  def self.version
    [MAJOR_VERSION, MINOR_VERSION, PATCH_VERSION].join
  end
end
