describe Fastlane do
  describe Fastlane::FastFile do
    describe "Pod Lib Lint action" do
      before :each do
        allow(FastlaneCore::FastlaneFolder).to receive(:path).and_return(nil)
      end

      it "generates the correct pod lib lint command with no parameters" do
        result = Fastlane::FastFile.new.parse("lane :test do
          pod_lib_lint
        end").runner.execute(:test)

        expect(result).to eq("bundle exec pod lib lint")
      end

      it "generates the correct pod lib lint command with a verbose parameter" do
        result = Fastlane::FastFile.new.parse("lane :test do
          pod_lib_lint(verbose: true)
        end").runner.execute(:test)

        expect(result).to eq("bundle exec pod lib lint --verbose")
      end

      it "generates the correct pod lib lint command with allow warnings parameter" do
        result = Fastlane::FastFile.new.parse("lane :test do
          pod_lib_lint(allow_warnings: true)
        end").runner.execute(:test)

        expect(result).to eq("bundle exec pod lib lint --allow-warnings")
      end

      it "generates the correct pod lib lint command with quick parameter" do
        result = Fastlane::FastFile.new.parse("lane :test do
          pod_lib_lint(quick: true)
        end").runner.execute(:test)

        expect(result).to eq("bundle exec pod lib lint --quick")
      end

      it "generates the correct pod lib lint command with private parameter" do
        result = Fastlane::FastFile.new.parse("lane :test do
          pod_lib_lint(private: true)
        end").runner.execute(:test)

        expect(result).to eq("bundle exec pod lib lint --private")
      end

      it "generates the correct pod lib lint command with fail-fast parameter" do
        result = Fastlane::FastFile.new.parse("lane :test do
          pod_lib_lint(fail_fast: true)
        end").runner.execute(:test)

        expect(result).to eq("bundle exec pod lib lint --fail-fast")
      end

      it "generates the correct pod lib lint command with use-libraries parameter" do
        result = Fastlane::FastFile.new.parse("lane :test do
          pod_lib_lint(use_libraries: true)
        end").runner.execute(:test)

        expect(result).to eq("bundle exec pod lib lint --use-libraries")
      end

      it "generates the correct pod lib lint command with swift-version parameter" do
        result = Fastlane::FastFile.new.parse("lane :test do
          pod_lib_lint(swift_version: '4.2')
        end").runner.execute(:test)

        expect(result).to eq("bundle exec pod lib lint --swift-version=4.2")
      end

      it "generates the correct pod lib lint command with podspec parameter" do
        result = Fastlane::FastFile.new.parse("lane :test do
          pod_lib_lint(podspec: 'fastlane')
        end").runner.execute(:test)

        expect(result).to eq("bundle exec pod lib lint fastlane")
      end

      it "generates the correct pod lib lint command with subspec parameter" do
        result = Fastlane::FastFile.new.parse("lane :test do
          pod_lib_lint(subspec: 'test-subspec')
        end").runner.execute(:test)

        expect(result).to eq("bundle exec pod lib lint --subspec='test-subspec'")
      end

      it "generates the correct pod lib lint command with use_modular_headers parameter" do
        result = Fastlane::FastFile.new.parse("lane :test do
          pod_lib_lint(use_modular_headers: true)
        end").runner.execute(:test)

        expect(result).to eq("bundle exec pod lib lint --use-modular-headers")
      end

      it "generates the correct pod lib lint command with include_podspecs parameter" do
        result = Fastlane::FastFile.new.parse("lane :test do
          pod_lib_lint(include_podspecs: '**/*.podspec')
        end").runner.execute(:test)

        expect(result).to eq("bundle exec pod lib lint --include-podspecs='**/*.podspec'")
      end

      it "generates the correct pod lib lint command with external_podspecs parameter" do
        result = Fastlane::FastFile.new.parse("lane :test do
          pod_lib_lint(external_podspecs: '**/*.podspec')
        end").runner.execute(:test)

        expect(result).to eq("bundle exec pod lib lint --external-podspecs='**/*.podspec'")
      end
    end
  end
end
