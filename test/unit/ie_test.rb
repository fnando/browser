require "test_helper"

class IeTest < Minitest::Test
  setup do
    @browser = Browser.new
  end

  test "detects ie6" do
    @browser.ua = $ua["IE6"]

    assert_equal "Internet Explorer", @browser.name
    assert @browser.ie?
    assert @browser.ie?(6)
    refute @browser.modern?
    assert_equal "6.0", @browser.full_version
    assert_equal "6", @browser.version
  end

  test "detects ie7" do
    @browser.ua = $ua["IE7"]

    assert_equal "Internet Explorer", @browser.name
    assert @browser.ie?
    assert @browser.ie?(7)
    refute @browser.modern?
    assert_equal "7.0", @browser.full_version
    assert_equal "7", @browser.version
  end

  test "detects ie8" do
    @browser.ua = $ua["IE8"]

    assert_equal "Internet Explorer", @browser.name
    assert @browser.ie?
    assert @browser.ie?(8)
    refute @browser.modern?
    refute @browser.compatibility_view?
    assert_equal "8.0", @browser.full_version
    assert_equal "8", @browser.version
  end

  test "detects ie8 in compatibility view" do
    @browser.ua = $ua["IE8_COMPAT"]

    assert_equal "Internet Explorer", @browser.name
    assert @browser.ie?
    assert @browser.ie?(8)
    refute @browser.modern?
    assert @browser.compatibility_view?
    assert_equal "8.0", @browser.full_version
    assert_equal "8", @browser.version
    assert_equal "7.0", @browser.msie_full_version
    assert_equal "7", @browser.msie_version
  end

  test "detects ie9" do
    @browser.ua = $ua["IE9"]

    assert_equal "Internet Explorer", @browser.name
    assert @browser.ie?
    assert @browser.ie?(9)
    assert @browser.modern?
    refute @browser.compatibility_view?
    assert_equal "9.0", @browser.full_version
    assert_equal "9", @browser.version
  end

  test "detects ie9 in compatibility view" do
    @browser.ua = $ua["IE9_COMPAT"]

    assert_equal "Internet Explorer", @browser.name
    assert @browser.ie?
    assert @browser.ie?(9)
    refute @browser.modern?
    assert @browser.compatibility_view?
    assert_equal "9.0", @browser.full_version
    assert_equal "9", @browser.version
    assert_equal "7.0", @browser.msie_full_version
    assert_equal "7", @browser.msie_version
  end

  test "detects ie10" do
    @browser.ua = $ua["IE10"]

    assert_equal "Internet Explorer", @browser.name
    assert @browser.ie?
    assert @browser.ie?(10)
    assert @browser.modern?
    refute @browser.compatibility_view?
    assert_equal "10.0", @browser.full_version
    assert_equal "10", @browser.version
  end

  test "detects ie10 in compatibility view" do
    @browser.ua = $ua["IE10_COMPAT"]

    assert_equal "Internet Explorer", @browser.name
    assert @browser.ie?
    assert @browser.ie?(10)
    refute @browser.modern?
    assert @browser.compatibility_view?
    assert_equal "10.0", @browser.full_version
    assert_equal "10", @browser.version
    assert_equal "7.0", @browser.msie_full_version
    assert_equal "7", @browser.msie_version
  end

  test "detects ie11" do
    @browser.ua = $ua["IE11"]

    assert_equal "Internet Explorer", @browser.name
    assert @browser.ie?
    assert @browser.ie?(11)
    assert @browser.modern?
    refute @browser.compatibility_view?
    assert_equal "11.0", @browser.full_version
    assert_equal "11", @browser.version
  end

  test "detects ie11 in compatibility view" do
    @browser.ua = $ua["IE11_COMPAT"]

    assert_equal "Internet Explorer", @browser.name
    assert @browser.ie?
    assert @browser.ie?(11)
    refute @browser.modern?
    assert @browser.compatibility_view?
    assert_equal "11.0", @browser.full_version
    assert_equal "11", @browser.version
    assert_equal "7.0", @browser.msie_full_version
    assert_equal "7", @browser.msie_version
  end

  test "detects Lumia 800" do
    @browser.ua = $ua["LUMIA800"]

    assert_equal "Internet Explorer", @browser.name
    assert @browser.ie?
    assert @browser.ie?(9)
    assert_equal "9.0", @browser.full_version
    assert_equal "9", @browser.version
    refute @browser.tablet?
    assert @browser.mobile?
  end

  test "detects ie11 touch desktop pc" do
    @browser.ua = $ua["IE11_TOUCH_SCREEN"]

    assert_equal "Internet Explorer", @browser.name
    assert @browser.ie?
    assert @browser.ie?(11)
    assert @browser.modern?
    refute @browser.compatibility_view?
    refute @browser.windows_rt?
    assert @browser.windows_touchscreen_desktop?
    assert @browser.windows8?
    assert_equal "11.0", @browser.full_version
    assert_equal "11", @browser.version
  end

  test "detects Microsoft Edge" do
    @browser.ua = $ua["MS_EDGE"]

    assert_equal :edge, @browser.id
    assert_equal "Microsoft Edge", @browser.name
    assert_equal "12.0", @browser.full_version
    assert_equal "12", @browser.version
    assert @browser.windows10?
    assert @browser.edge?
    assert @browser.modern?
    refute @browser.webkit?
    refute @browser.chrome?
    refute @browser.safari?
    refute @browser.mobile?
  end

  test "detects Microsoft Edge in compatibility view" do
    @browser.ua = $ua["MS_EDGE_COMPAT"]

    assert_equal :edge, @browser.id
    assert_equal "Microsoft Edge", @browser.name
    assert_equal "12.0", @browser.full_version
    assert_equal "12", @browser.version
    assert_equal "7.0", @browser.msie_full_version
    assert_equal "7", @browser.msie_version
    assert @browser.edge?
    assert @browser.compatibility_view?
    refute @browser.modern?
    refute @browser.webkit?
    refute @browser.chrome?
    refute @browser.safari?
    refute @browser.mobile?
  end

  test "detects Microsoft Edge Mobile" do
    @browser.ua = $ua["MS_EDGE_MOBILE"]

    assert_equal :edge, @browser.id
    assert_equal "Microsoft Edge", @browser.name
    assert_equal "12.0", @browser.full_version
    assert_equal "12", @browser.version
    refute @browser.windows10?
    assert @browser.windows_phone?
    assert @browser.edge?
    assert @browser.modern?
    assert @browser.mobile?
    refute @browser.webkit?
    refute @browser.chrome?
    refute @browser.safari?
  end

  test "detects IE without Trident" do
    @browser.ua = $ua["IE_WITHOUT_TRIDENT"]

    assert_equal :ie, @browser.id
    assert_equal "Internet Explorer", @browser.name
    assert_equal "0.0", @browser.msie_full_version
    assert_equal "0", @browser.msie_version
    assert_equal "0.0", @browser.full_version
    assert_equal "0", @browser.version
    refute @browser.windows10?
    refute @browser.windows_phone?
    refute @browser.edge?
    refute @browser.modern?
    refute @browser.mobile?
    refute @browser.webkit?
    refute @browser.chrome?
    refute @browser.safari?
  end

  test "detects windows phone" do
    @browser.ua = $ua["WINDOWS_PHONE"]

    assert @browser.ie?
    assert_equal "7", @browser.version
    assert @browser.mobile?
    assert @browser.windows_phone?
    refute @browser.windows_mobile?
    refute @browser.tablet?
  end

  test "detects windows phone 8" do
    @browser.ua = $ua["WINDOWS_PHONE8"]

    assert @browser.ie?
    assert_equal "10", @browser.version
    assert @browser.mobile?
    assert @browser.windows_phone?
    refute @browser.windows_mobile?
    refute @browser.tablet?
  end

  test "detects windows phone 8.1" do
    @browser.ua = $ua["WINDOWS_PHONE_81"]

    assert @browser.ie?
    assert_equal "Internet Explorer", @browser.name
    assert_equal :ie, @browser.id
    assert_equal "11", @browser.version
    assert_equal "11.0", @browser.full_version
    assert @browser.mobile?
    assert @browser.windows_phone?
    refute @browser.windows_mobile?
    refute @browser.tablet?
  end

  test "detects windows mobile (windows phone 8)" do
    @browser.ua = $ua["WINDOWS_PHONE8"]

    assert @browser.ie?
    assert_equal "10", @browser.version
    assert @browser.mobile?
    assert @browser.windows_phone?
    refute @browser.windows_mobile?
    refute @browser.tablet?
  end

  test "detects windows x64" do
    @browser.ua = $ua["IE10_X64_WINX64"]
    assert @browser.windows_x64?
    refute @browser.windows_wow64?
    assert @browser.windows_x64_inclusive?
  end

  test "detects windows wow64" do
    @browser.ua = $ua["WINDOWS_WOW64"]
    refute @browser.windows_x64?
    assert @browser.windows_wow64?
    assert @browser.windows_x64_inclusive?
  end

  test "detects windows platform" do
    @browser.ua = "Windows"
    assert_equal :windows, @browser.platform
    assert @browser.windows?
  end

  test "detects windows_xp" do
    @browser.ua = $ua["WINDOWS_XP"]

    assert @browser.windows?
    assert @browser.windows_xp?
  end

  test "detects windows_vista" do
    @browser.ua = $ua["WINDOWS_VISTA"]

    assert @browser.windows?
    assert @browser.windows_vista?
  end

  test "detects windows7" do
    @browser.ua = $ua["WINDOWS7"]

    assert @browser.windows?
    assert @browser.windows7?
  end

  test "detects windows8" do
    @browser.ua = $ua["WINDOWS8"]

    assert @browser.windows?
    assert @browser.windows8?
    refute @browser.windows8_1?
  end

  test "detects windows8.1" do
    @browser.ua = $ua["WINDOWS81"]

    assert @browser.windows?
    assert @browser.windows8?
    assert @browser.windows8_1?
  end

  test "returns string representation for ie6" do
    @browser.ua = $ua["IE6"]
    meta = @browser.meta

    assert meta.include?("ie")
    assert meta.include?("ie6")
    assert meta.include?("oldie")
    assert meta.include?("lt-ie8")
    assert meta.include?("lt-ie9")
    assert meta.include?("windows")
  end

  test "returns string representation for ie7" do
    @browser.ua = $ua["IE7"]
    meta = @browser.meta

    assert meta.include?("ie")
    assert meta.include?("ie7")
    assert meta.include?("oldie")
    assert meta.include?("lt-ie8")
    assert meta.include?("lt-ie9")
    assert meta.include?("windows")
  end

  test "returns string representation for ie8" do
    @browser.ua = $ua["IE8"]
    meta = @browser.meta

    assert meta.include?("ie")
    assert meta.include?("ie8")
    assert meta.include?("lt-ie9")
    assert meta.include?("windows")
  end

  test "warn about deprecated numbered version" do
    message = "Browser#ie6? is deprecated; use Browser#ie?(version) instead"
    assert_deprecated(message, __FILE__, __LINE__) { @browser.ie6? }
  end

  test "don't detect as two different versions" do
    @browser.ua = $ua["IE8"]
    assert @browser.ie?(8)
    refute @browser.ie?(7)
  end
end
