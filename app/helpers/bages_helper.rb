module BagesHelper

  RULE_SELECT = ['all math tests passed','all history tests passed', 'successful passing of the test on the first attempt',
                 'successful passing all the tests of the easy level', 'successful passing all the tests of the elementary level',
                 'successful passing all the tests of the advanced level', 'successful passing all the tests of the hard level']

  def rule_select_key(key)
    RULE_SELECT[key]
  end

end
