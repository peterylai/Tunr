require 'spec_helper'

describe "an admin can manage songs" do
  let(:user) { FactoryGirl.create(:user) }
  let!(:beyonce) { Artist.create(name: "Beyonce", genre: "Pop", photo_url: "http://www.tickpick.com/DesktopModules/SearchResults/img/performers/beyonce.jpg")}
  let!(:halo) { Song.create( title: "Halo", year: 2009, artist: beyonce)}

  it "can create a new song" do
    visit new_artist_song_path(beyonce)
    fill_in "song_title", with: "halo"
    fill_in "song_year", with: "2008"
    click_button("submit")
    expect(page).to have_content "halo"
  end

  it "can view an existing song" do
    visit artist_path(beyonce)
    expect(page).to have_content "Halo"
  end

  it "can update a song" do
    visit edit_song_path(halo)
    fill_in "song_title", with: "Crazy in Love"
    click_button("submit")
    expect(page).to have_content "Crazy in Love"
    expect(page).to_not have_content "Halo"
  end

  it "can destroy a song" do
    login(user)
    visit artist_path(beyonce)
    click_button("delete-song-#{halo.id}")
    expect(page).to_not have_content("Halo")
  end

  def login(user)
    visit "/signin"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign in"
  end


end

