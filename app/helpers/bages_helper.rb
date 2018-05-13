module BagesHelper

  RULE_SELECT = { 1 => 'all math tests passed',
                  2 => 'all history tests passed',
                  3 => 'successful passing of the test on the first attempt',
                  4 => 'successful passing all the tests of the easy level',
                  5 => 'successful passing all the tests of the elementary level',
                  6 => 'successful passing all the tests of the advanced level',
                  7 => 'successful passing all the tests of the hard level'}.freeze

  def rule_select_key(key)
    RULE_SELECT[key]
  end

end
