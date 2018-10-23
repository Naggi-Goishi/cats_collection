require 'test_helper'

class CatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cat = cats(:one)
  end

  test 'should get index' do
    get root_url
    assert_response :success
  end

  test 'should get new' do
    get new_cat_url
    assert_response :success
  end

  test 'should create cat' do
    url = 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f0/Station-Master_Tama.JPG/600px-Station-Master_Tama.JPG'
    post cats_url, params: { cat: { name: 'たま', age: '4', text: '猫の駅長', url: url } }

    assert_redirected_to root_url
    assert_equal '猫の保存に成功しました', flash[:notice]
  end

  test 'should show cat' do
    get cat_url(@cat)
    assert_response :success
  end

  test 'should get edit' do
    get edit_cat_url(@cat)
    assert_response :success
  end

  test 'should update cat' do
    patch cat_url(@cat), params: { cat: { age: 5 } }

    assert_redirected_to root_url
    @cat.reload
    assert_equal 5, @cat.age
  end

  test 'should destroy cat' do
    assert_difference('Cat.count', -1) do
      delete cat_url(@cat)
    end

    assert_redirected_to root_url
  end
end
