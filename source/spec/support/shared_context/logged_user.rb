shared_context "with logged user" do |admin: false|
  let(:logged_user) { create(:user, admin: admin) }
  let(:session)     { create(:session, user: logged_user) }

  before do
    cookies.signed[:session] = session.id
  end
end
