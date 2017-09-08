require 'spec_helper'

describe "DbConnectionService" do
  let(:sv) {DbConnectionService.new establish_retry_wait_seconds: 3}
  it ".ensure_db_connection HAPPY" do
    expect(sv).to receive(:establish_connection).and_return true
    expect(sv.ensure_db_connection).to eq true
  end
  it ".ensure_db_connection SAD" do
    expect(sv).to receive(:establish_connection).and_return false
    expect(sv).to receive(:pause).with(3).and_return true
    expect(sv).to receive(:try_establish_connection).and_return true
    expect(sv.ensure_db_connection).to eq true
  end
end
