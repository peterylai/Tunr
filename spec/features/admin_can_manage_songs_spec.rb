require 'spec_helper'

describe "an admin can manage songs" do
  let(:user) { FactoryGirl.create(:user) }
  let(:beyonce) { FactoryGirl.create(:artist)}
  let!(:halo) { FactoryGirl.create(:song, artist: beyonce)}
  let(:single_ladies) {FactoryGirl.build(:song)}

  it "can create a new song" do
    visit new_artist_song_path(beyonce)
    fill_in "song_title", with: single_ladies.title
    fill_in "song_year", with: single_ladies.year
    click_button("submit")
    expect(page).to have_content single_ladies.title
  end

  it "can view an existing song" do
    visit artist_path(beyonce)
    expect(page).to have_content halo.title
  end

  it "can update a song" do
    visit edit_song_path(halo)
    fill_in "song_title", with: "Crazy in Love"
    click_button("submit")
    expect(page).to have_content "Crazy in Love"
    expect(page).to_not have_content halo.title
  end

  it "can destroy a song" do
    login(user)
    visit artist_path(beyonce)
    click_button("delete-song-#{halo.id}")
    expect(page).to_not have_content(halo.title)
  end

  def login(user)
    visit "/signin"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign in"
  end


end

