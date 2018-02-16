module SessionsHelper

  FLASH_MASSAGE = { :alert => 'Are you a Guru? Verify your Email and Password please' }.freeze

  def flash_massage(massage)
    FLASH_MASSAGE[massage]
  end
end
