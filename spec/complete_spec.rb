require "spec_helper"

describe "social_snippet#complete" do

  context "enable social_snippet" do

    before { enable_social_snippet }

    describe "#is_repo_name_mode" do

      context "str = // @snip" do
        subject { vim.command 'echomsg social_snippet#complete#is_repo_name_mode("// @snip")' }
        it { should eq "0" }
      end

      context "str = // @snip <" do
        subject { vim.command 'echomsg social_snippet#complete#is_repo_name_mode("// @snip <")' }
        it { should eq "1" }
      end

      context "str = // @snip <repo" do
        subject { vim.command 'echomsg social_snippet#complete#is_repo_name_mode("// @snip <repo")' }
        it { should eq "1" }
      end

      context "str = // @snip <repo#1.2.3" do
        subject { vim.command 'echomsg social_snippet#complete#is_repo_name_mode("// @snip <repo#1.2.3")' }
        it { should eq "0" }
      end

      context "str = // @snip <repo:path/to/file" do
        subject { vim.command 'echomsg social_snippet#complete#is_repo_name_mode("// @snip <repo:path/to/file")' }
        it { should eq "0" }
      end

      context "str = // @snip <repo#1.2.3:path/to/file" do
        subject { vim.command 'echomsg social_snippet#complete#is_repo_name_mode("// @snip <repo#1.2.3:path/to/file")' }
        it { should eq "0" }
      end

    end # is_repo_name_mode

    describe "#repo_name" do

      context "keyword = ex" do

        context "use cli" do
          before { vim.command "call append(0, join(social_snippet#complete#complete_cli('@snip <ex'), \"\n\"))" }
          let(:output) { vim_current_buffer }
          it { expect(output).to match /example-repo/ }
        end

        context "use ruby", :rubyinterp => true do
          before { vim.command "call append(0, join(social_snippet#complete#complete_ruby('@snip <ex'), \"\n\"))" }
          let(:output) { vim_current_buffer }
          it { expect(output).to match /example-repo/ }
        end

      end # keyword = ex

    end # repo_name

    describe "#file_name" do

      context "keyword = example-repo:fu" do

        context "use cli" do
          before { vim.command "call append(0, join(social_snippet#complete#complete_cli('@snip <example-repo:fu'), \"\n\"))" }
          let(:output) { vim_current_buffer }
          it { expect(output).to match /func\.cpp/ }
          it { expect(output).to match /func\// }
        end

        context "use ruby", :rubyinterp => true do
          before { vim.command "call append(0, join(social_snippet#complete#complete_ruby('@snip <example-repo:fu'), \"\n\"))" }
          let(:output) { vim_current_buffer }
          it { expect(output).to match /func\.cpp/ }
          it { expect(output).to match /func\// }
        end

      end # keyword = example-repo:fu

    end # repo_name

  end # enable social_snippet

end # social_snippet#complete

