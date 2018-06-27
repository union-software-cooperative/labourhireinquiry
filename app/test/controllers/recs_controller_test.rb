require 'test_helper'

class RecsControllerTest < ActionController::TestCase
  setup do
    @rec = recs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rec" do
    assert_difference('Rec.count') do
      post :create, rec: { attachment: @rec.attachment, company: @rec.company, coverage: @rec.coverage, end_date: @rec.end_date, local_union_contact: @rec.local_union_contact, name: @rec.name, national_union_contact: @rec.national_union_contact, product_service: @rec.product_service, start_date: @rec.start_date, tags: @rec.tags, union: @rec.union }
    end

    assert_redirected_to rec_path(assigns(:rec))
  end

  test "should show rec" do
    get :show, id: @rec
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rec
    assert_response :success
  end

  test "should update rec" do
    patch :update, id: @rec, rec: { attachment: @rec.attachment, company: @rec.company, coverage: @rec.coverage, end_date: @rec.end_date, local_union_contact: @rec.local_union_contact, name: @rec.name, national_union_contact: @rec.national_union_contact, product_service: @rec.product_service, start_date: @rec.start_date, tags: @rec.tags, union: @rec.union }
    assert_redirected_to rec_path(assigns(:rec))
  end

  test "should destroy rec" do
    assert_difference('Rec.count', -1) do
      delete :destroy, id: @rec
    end

    assert_redirected_to recs_path
  end
end
