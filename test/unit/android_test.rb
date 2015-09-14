require "test_helper"

class AndroidTest < Minitest::Test
  setup do
    @browser = Browser.new
  end

  test "detect android cupcake (1.5)" do
    @browser.ua = $ua['ANDROID_CUPCAKE']
    assert @browser.android?
    assert @browser.android?(1.5)
  end

  test "detect android donut (1.6)" do
    @browser.ua = $ua['ANDROID_DONUT']
    assert @browser.android?
    assert @browser.android?(1.6)
  end

  test "detect android eclair (2.1)" do
    @browser.ua = $ua['ANDROID_ECLAIR_21']
    assert @browser.android?
    assert @browser.android?(2.1)
  end

  test "detect android froyo (2.2)" do
    @browser.ua = $ua['ANDROID_FROYO']
    assert @browser.android?
    assert @browser.android?(2.2)
  end

  test "detect android gingerbread (2.3)" do
    @browser.ua = $ua['ANDROID_GINGERBREAD']
    assert @browser.android?
    assert @browser.android?(2.3)
  end

  test "detect android honeycomb (3.0)" do
    @browser.ua = $ua['ANDROID_HONEYCOMB_30']
    assert @browser.android?
    assert @browser.android?(3.0)
  end

  test "detect android ice cream sandwich (4.0)" do
    @browser.ua = $ua['ANDROID_ICECREAM']
    assert @browser.android?
    assert @browser.android?(4.0)
  end

  test "detect android jellybean (4.1)" do
    @browser.ua = $ua['ANDROID_JELLYBEAN_41']
    assert @browser.android?
    assert @browser.android?(4.1)
  end

  test "detect android jellybean (4.2)" do
    @browser.ua = $ua['ANDROID_JELLYBEAN_42']
    assert @browser.android?
    assert @browser.android?(4.2)
  end

  test "detect android jellybean (4.3)" do
    @browser.ua = $ua['ANDROID_JELLYBEAN_43']
    assert @browser.android?
    assert @browser.android?(4.3)
  end

  test "detect android kitkat (4.4)" do
    @browser.ua = $ua['ANDROID_KITKAT']
    assert @browser.android?
    assert @browser.android?(4.4)
  end

  test "detect android lollipop (5.0)" do
    @browser.ua = $ua['ANDROID_LOLLIPOP_50']
    assert @browser.android?
    assert @browser.android?(5.0)
  end

  test "detect android lollipop (5.1)" do
    @browser.ua = $ua['ANDROID_LOLLIPOP_51']
    assert @browser.android?
    assert @browser.android?(5.1)
  end

  test "detect android tv" do
    @browser.ua = $ua['ANDROID_TV']
    assert @browser.android?
    assert @browser.tv?
  end

  test "detect nexus player" do
    @browser.ua = $ua['ANDROID_NEXUS_PLAYER']
    assert @browser.android?
    assert @browser.tv?
  end
end
