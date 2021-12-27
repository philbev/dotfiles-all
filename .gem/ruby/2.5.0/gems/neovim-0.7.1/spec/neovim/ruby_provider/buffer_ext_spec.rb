require "helper"
require "neovim/ruby_provider/buffer_ext"

module Neovim
  RSpec.describe Buffer do
    let!(:nvim) do
      Neovim.attach_child(Support.child_argv).tap do |nvim|
        stub_const("::Vim", nvim)
      end
    end

    after { nvim.shutdown }

    describe ".current" do
      it "returns the current buffer from the global Vim client" do
        expect(Buffer.current).to eq(nvim.get_current_buf)
      end
    end

    describe ".count" do
      it "returns the current buffer count from the global Vim client" do
        expect do
          nvim.command("new")
        end.to change { Buffer.count }.by(1)
      end
    end

    describe ".[]" do
      it "returns the buffer from the global Vim client at the given index" do
        expect(Buffer[0]).to eq(nvim.get_current_buf)
        nvim.command("new")
        expect(Buffer[1]).to eq(nvim.get_current_buf)
      end
    end
  end
end
