require 'spec_helper'

describe User do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_numericality_of(:balance).is_greater_than_or_equal_to(0)}

  describe "#purchase" do
    let(:user) { FactoryGirl.create(:user, balance: 4.00)}
    let(:against_all_odds) { FactoryGirl.create(:song) }

    context "user has enough money" do
      before { user.purchase(against_all_odds)}

      it "adds the song to the users songs" do
        expect(user.songs).to include(against_all_odds)
      end

      it "debits the users balance" do
        expect(user.balance.to_f).to eq(4.00 - against_all_odds.price)
      end

    end

    context "user does not have enough money" do
      before do
        against_all_odds.price = 6.00
        user.purchase(against_all_odds)
      end

      it "doesn't add the song to the users songs" do
        expect(user.songs).to_not include(against_all_odds)
      end

      it "doesn't charge the user" do
        expect(user.reload.balance.to_f).to eq(4.00)
      end
    end

  end

end