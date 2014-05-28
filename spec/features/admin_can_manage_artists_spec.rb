require 'spec_helper'

describe "an admin can manage artists" do
  let(:user) { FactoryGirl.create(:user) }
  let(:beyonce) { FactoryGirl.create(:artist) }
  let(:kesha) {FactoryGirl.build(:artist)}
  
  it "can create a new artist" do
    visit new_artist_path
    fill_in "artist_name", with: kesha.name
    fill_in "artist_genre", with: kesha.genre
    fill_in "artist_photo_url", with: kesha.photo_url
    click_button("submit")
    expect(page).to have_content kesha.name
  end

  it "can view an existing artist" do
    visit artist_path(beyonce)
    expect(page).to have_content beyonce.name
  end

  it "can update an artist" do
    visit edit_artist_path(beyonce)
    fill_in "artist_name", with: "Queen Bey"
    click_button("submit")
    expect(page).to have_content "Queen Bey"
  end

  it "can destroy an artist" do
    login(user)
    visit artist_path(beyonce)
    click_button("destroy")
    expect(page).to_not have_content(beyonce.name)
  end

  def login(user)
    visit "/signin"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign in"
  end

end