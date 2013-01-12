# coding: utf-8
require_relative '../vending_machine.rb'

describe "Vending Machine" do
  before do
    @vending_machine = VendingMachine.new
  end





  subject { @vending_machine }

  context '10円入れてある状態' do
    before do
      @vending_machine.insert 10
    end
    its(:total_money){ should == 10 }
    its(:refund){ should == 10 }
  end

  context '150円入れてある状態' do
    before do
      @vending_machine.insert 100
      @vending_machine.insert 50
    end
    its(:total_money){ should == 150 }
  end

  def current_total_money
    @vending_machine.total_money
  end






  it "投入前のお金の総計は0である" do
    current_total_money.should == 0
  end

  it "投入したお金(10円)の総計を取得できる" do
    @vending_machine.insert 10
    @vending_machine.total_money.should == 10
  end

  it "投入したお金(100円)の総計を取得できる" do
    @vending_machine.insert 100
    @vending_machine.total_money.should == 100
  end

  it "100円と50円を投入したら150円と取得できる" do
    @vending_machine.insert 100
    @vending_machine.insert 50
    @vending_machine.total_money.should == 150
  end

  it "払い戻し操作をすれば、総計を出力する" do
    @vending_machine.insert 100
    @vending_machine.insert 50

    @vending_machine.refund
    @vending_machine.change.should == 150
  end

  it "払い戻し後の総計は0円" do
    @vending_machine.insert 100
    @vending_machine.insert 50
    @vending_machine.refund.should == 150
    @vending_machine.refund.should == 0
  end

  it "1円が投入されれも総計に加算しない " do
    @vending_machine.insert 100
    @vending_machine.insert 1
    @vending_machine.refund.should == 100
  end

  it "1円が投入されたら1円を表示する" do
    @vending_machine.insert 100
    @vending_machine.insert 1
    @vending_machine.change.should == 1
    @vending_machine.change.should == 0
  end

  it "5円が投入されれも総計に加算しない " do
    @vending_machine.insert 100
    @vending_machine.insert 5
    @vending_machine.refund.should == 100
  end



end

