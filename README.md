# Buildroot External Example

This repository serves as an example of how to set up an external tree for Buildroot.

## Why Use an External Tree?

When working with Buildroot, it's a good practice to keep custom configurations and packages separate from the Buildroot source tree. This approach ensures:
- **Decoupling:** Customizations are maintained independently, making it easier to update Buildroot without conflicts.
- **Reproducibility:** Your configurations and applications are stored in a separate repository, ensuring consistency across different builds.
- **Maintainability:** Changes to your applications do not interfere with Buildroot's internal structure.

## How Does This Work?

Buildroot allows you to embed your own packages into a custom Linux image. Instead of manually installing each application after boot, you can instruct Buildroot to:
1. Download your external packages directly from your GitHub repositories.
2. Compile and integrate them automatically into the final root filesystem.
3. Provide them as selectable options in the Buildroot `menuconfig`.

## What Was Implemented?

This repository includes:

✅ Four external repositories with different applications ([morning](https://github.com/moschiel/good_morning_app_example), [afternoon](https://github.com/moschiel/good_afternoon_app_example), [night](https://github.com/moschiel/good_night_app_example) and [simple_stream_server](https://github.com/moschiel/simple_stream_server)).

✅ Buildroot configuration to fetch and compile these applications automatically.

✅ A `menuconfig` section named **"External Options"**, where these applications appear as selectable packages.

✅ The ability to generate a Linux image containing these applications pre-installed.


## Directory Structure

- `extern/`: Contains external configurations and package definitions.
- `buildroot/`: Submodule of the Buildroot build system.
- `clear_build.sh`: Script to clean the build directory.
- `variables.sh`: Script containing environment variables used by other scripts.
- `list_defconfigs.sh`: Script to display available defconfigs for Buildroot.
- `menuconfig.sh`: Script to run a GUI to display and edit current configuration.
- `save_custom_defconfig.sh`: Script to save the current configuration as a custom defconfig.
- `set_custom_defconfig.sh`: Script to set up a custom defconfig.
- `set_default_defconfig.sh`: Script to set up the default defconfig.
- `rebuild_and_install_external_package.sh`: Script to rebuild all external packages, and install in the build image.
- `runqemu.sh`: Script to run the built system in QEMU (used when testing in an QEMU defconfig).

## Usage

To use this external repository with Buildroot:

1. **Initialize and update the Buildroot submodule**:
   ```bash
   git submodule update --init
   ```
   
   The next steps (2 to 3) are for creating your external custom configuration (defconfig)

   If you already have a external custom configuration (defconfig) that you want to use, do the following:
   - place the defconfig file in `extern/configs`
   - in `variables.sh`, update the parameter `CUSTOM_DEFCONFIG_NAME` with the defconfig file name
   - go to step 4

2. **Set up the default predefined configuration**
   
   Buildroot supplies many predefined configurations (defconfigs)
   
   In`variables.sh` under `DEFAULT_DEFCONFIG_NAME` the current defconfig is `qemu_aarch64_virt_defconfig`

   This provides a starting point to modify Buildroot settings, such as adding external packages.

   If you want a different default defconfig, you can search the available ones with the following command, and change `DEFAULT_DEFCONFIG_NAME` accordingly.
   ```bash
   ./list_defconfigs.sh
   ```

   Finally, to apply the default configuration, run this command:
   ```bash
   ./set_default_defconfig.sh
   ```
   Now buildroot applied the configuration using the defconfig set in `DEFAULT_DEFCONFIG_NAME` from `variables.sh`.
   
   You could go to step 6 now if you want to build with the default defconfig, but what is the fun in just using a default configuration right?
   
3. **Customize the configuration and Save your own defconfig externally**:
   - Run `menuconfig.sh` to modify settings as needed.
   - If you want to add our custom external packages (available in `extern/package`), select `External options`, then select our custom external packages.
     
      Note: the external package `simple_stream_server` allows you to configure if its executable should initialize automatically on boot, and what should be its initialization priority.
     
    ![image](https://github.com/user-attachments/assets/4dcdce58-f617-4303-9213-804c85087f99)

   - Once changes are made, save them externally:
     ```bash
     ./save_custom_defconfig.sh
     ```
     This saves the configuration externally in `extern/configs` with the name set in `CUSTOM_DEFCONFIG_NAME` from `variables.sh`. If you want to save it with another name, just change `CUSTOM_DEFCONFIG_NAME` value.

4. **Verify that Buildroot recognizes the external configuration**:
   ```bash
   ./list_defconfigs.sh
   ```
   Your custom configuration should appear in the **bottom**, under **"External configs in ROGER_TUTORIAL"**.
   
    ![image](https://github.com/user-attachments/assets/76d633f6-556e-467f-a28e-c877949dbc55)


5. **Set buildroot to use the external configuration**:
   ```bash
   ./set_custom_defconfig.sh
   ```
   Now buildroot applied your external custom configuration defined in `variables.sh`, in parameter `CUSTOM_DEFCONFIG_NAME`.

6. **Build the system**:
   ```bash
   make -C buildroot
   ```
   This is going to take several minutes if it is the first build for the selected defconfig.

7. **Run the built system**:
   - If using **QEMU**:
     ```bash
     ./runqemu.sh
     ```
   - If using **Raspberry Pi or another board with sdcard image support**, flash the generated `sdcard.img` to an SD card.


## Example Output
After building the image and booting into the system you are able to test if everything went as expected.

In this example, we have configured the executable `simple_stream_server` to **init automatically on boot**, that's why it shows the message `simple_stream_server started` on the boot sequence.

Also, after login, you can run the executables `morning`, `afternoon` and `night` by typing their names in the terminal:

![image](https://github.com/user-attachments/assets/6871dcb9-36fe-42e3-9bf9-4f887246cddb)

This proves that the executables were correctly embedded into the Linux image!

---

For more details on using external repositories with Buildroot, refer to the [Buildroot documentation](https://buildroot.org/downloads/manual/manual.html#outside-br-custom).
