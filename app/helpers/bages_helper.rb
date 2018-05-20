module BagesHelper

  RULE_SELECT = ['all some category tests passed',
                 'successful passing of the test on the first attempt',
                 'successful passing all the tests of some level']

  def rule_select_key(key)
    RULE_SELECT[key]
  end

end
