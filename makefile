update_app_icon:
	flutter pub run flutter_launcher_icons

update_splash:
	dart run flutter_native_splash:create

remove_splash:
	dart run flutter_native_splash:remove

pod:
	cd ios && pod install
pod_update:
	cd ios && pod update --repo-update

refresh_ios:
	cd ios && rm -rf Podfile.lock
	cd ios && rm -rf Pods
	rm -rf Runner.xcworkspace
	cd ios & pod install

clean_aos:
	cd android && rm -rf .gradle
	cd android && rm -rf ~/.gradle
	rm -rf android/.gradle
	@echo "Android Gradle caches cleared."

run_release:
	flutter run --release


build_debug_apk:
	flutter build apk --debug

build_profile_apk:
	flutter build apk --profile

build_debug_ipa:
	flutter build ipa --release --export-method=ad-hoc
	#flutter build ipa --obfuscate --debug --export-method=ad-hoc --split-debug-info=/Users/minhyun/Desktop

#	flutter build ios --release --no-codesign
	#flutter build ipa --debug #--export-method ad-hoc--export-method development--export-method enterprise