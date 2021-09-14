require "spec_helper"

require_relative "../lib/contact_options"

RSpec.describe ContactOptions do
  context "calculate ranking" do
    it "has rank 3 by default" do
      contact = ContactOptions.new(name: "Alex Skrypko", email: "skrypko@skrypko.com")
      expect(contact.rank).to eq(3)
    end

    it "has rank 4 if no personal email" do
      contact = ContactOptions.new(name: "Alex Skrypko", email: "skrypko@gmail.com")
      expect(contact.rank).to eq(4)
    end

    it "has rank 3 + offer number" do
      contact = ContactOptions.new(name: "Alex Skrypko", email: "skrypko@skrypko.com", introsOffered: {free: 4, vip: 0})
      expect(contact.rank).to eq(7)
    end
  end

  context "calculate offer" do
    it "has free into" do
      contact = ContactOptions.new(name: "Alex Skrypko", email: "skrypko@gmail.com")
      expect(contact.offer).to eq("free")
    end

    it "has vip into" do
      contact = ContactOptions.new(name: "Alex Skrypko", email: "skrypko@gmail.com", introsOffered: {free: 99, vip: 0})
      expect(contact.offer).to eq("vip")
    end

    it "has free into if any vip" do
      contact = ContactOptions.new(name: "Alex Skrypko", email: "skrypko@gmail.com", introsOffered: {free: 99, vip: 1})
      expect(contact.offer).to eq("free")
    end
  end
end