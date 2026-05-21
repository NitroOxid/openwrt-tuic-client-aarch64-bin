# TUIC-client for OpenWrt
## Installation Steps

1. **Clone this repository into OpenWrt's packages directory:**
Place this directory inside the `openwrt/packages` folder:

- `cp -r tuic-client /path/to/openwrt/packages/`


2. **Navigate to the tuic-client directory:**
Change to the `tuic-client` directory:

- `cd /path/to/openwrt/packages/tuic-client`

3. **Run the `update.sh` script:**
This will update the version in the Makefile to upstream **tuic-client**.

- `./update.sh`

4. **Return to the OpenWrt root directory:**

- `cd /path/to/openwrt`

5. **Run `make menuconfig`:**
Open the configuration menu to enable **tuic-client** in your build.
- `make menuconfig`

- In the menu, navigate to `Network` -> `tuic-client` and select it to enable.

6. **Save your configuration changes:**
After selecting **tuic-client**, save the configuration.

7. **Build the package:**
Run the following command to compile the **tuic-client** package:

- `make package/tuic-client/compile`

This will build the package and make it ready to be installed on your OpenWrt device.

## Additional Information

- This script assumes that you already have a working OpenWrt build environment.
- Make sure your OpenWrt environment is updated before running the script.

## License

This project is licensed under the MIT License.
