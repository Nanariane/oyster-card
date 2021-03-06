require 'oystercard'

describe Oystercard do
  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station }
  let(:journey){ {entry_station: entry_station, exit_station: exit_station} }

  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end

describe '#top_up' do
  it { is_expected.to respond_to(:top_up).with(1).argument }
end

  it 'can top up the balance' do
    expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
  end

  it 'raises an error if the maximum balance is exceeded' do
    maximum_balance = Oystercard::MAXIMUM_BALANCE
    subject.top_up maximum_balance
    expect{ subject.top_up 1}.to raise_error "Maximum balance of #{maximum_balance} exceeded"
  end


# describe Oystercard do
  it {is_expected.to respond_to(:deduct).with(1).argument}

  it 'deducts an amount from the balance' do
    subject.top_up(20)
    expect{subject.deduct 3}.to change{subject.balance}.by -3
  end
# end


# describe Oystercard do

  it 'is not in a journey' do
    expect(subject).not_to be_in_journey
  end

  it 'can touch in' do
    subject.top_up(20)
    subject.touch_in(entry_station)
    expect(subject).to be_in_journey
  end

  it 'can touch out' do
    # subject.top_up(20)
    # subject.touch_in(entry_station)
    subject.touch_out(exit_station)
    expect(subject).not_to be_in_journey
  end

  it 'will not touch in if below balance' do
    expect{subject.touch_in(entry_station)}.to raise_error "Insufficient balance to touch in"
  end

  it 'will deduct when touch out' do
    expect{subject.touch_out(exit_station)}. to change{subject.balance}.by(-Oystercard::MINIMUM_CHARGE)
  end



  it 'stores the entry station' do
    subject.top_up(20)
    subject.touch_in(entry_station)
    expect(subject.entry_station).to eq entry_station
  end



  it 'stores exit station' do
    subject.top_up(20)
    subject.touch_in(entry_station)
    subject.touch_out(exit_station)
    expect(subject.exit_station).to eq exit_station
  end

  it 'stores the journey' do
    subject.top_up(20)
    subject.touch_in(entry_station)
    subject.touch_out(exit_station)
    expect(subject.travel_history).to include journey
  end

end
