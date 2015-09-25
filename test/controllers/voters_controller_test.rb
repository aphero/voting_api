require 'test_helper'

class VotersControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should get index" do
    get :index
    assert_response :success
    assert response.body.include?("THE THING YOU WANT TO FIND")
  end

  test "show is specific" do
    get :show, id: voters(:voter_person).id, access_token: voters(:voter_person).access_token
    assert_response :success
    assert response.body.include?("PERSON NAME")
    assert response.body.include?("OTHER PERSON NAME")
  end

  test "show requires correct token" do
    get :show, id: voters(:voter_person).id, access_token: "poops"
    assert_response :success
    assert response.body.include?("recount")
  end

  test "update can work" do
    patch :update, id: voters(:vanessa).id, access_token: voters(:vanessa).access_token, name: "Marion"
    assert_response :success
    refute response.body.include?("Vanessa Voter")
    assert response.body.include?("Marion")
    assert response.body.include?(voters(:vanessa).party)
  end
end
