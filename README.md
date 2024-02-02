# MediaConverter

MediaConverter is a serious open-source PowerShell module designed to facilitate media file conversion tasks. Currently, it provides a prototype that converts from .mvk to .mp4. Our goal is to develop a comprehensive and user-friendly media conversion tool for the PowerShell community.

## Project Overview

MediaConverter aims to fill the gap in the PowerShell community by providing a reliable and efficient tool for media file conversion. We are committed to dedicating full-time efforts to deliver a final version of the project that meets the highest standards of quality and usability.

## Installation

### Chocolatey

To install MediaConverter via Chocolatey, run the following command in an elevated PowerShell session:

```powershell
choco install mediaconverter

```

## Documentation

### Convert-MediaFile Command

The `Convert-MediaFile` command converts media files from one format to another.

#### Parameters

* `-File`: Specifies the path of the source file to be converted.
* `-Out` (or `-OutputDirectory`): Specifies the directory where the converted file will be saved. If not specified, the converted file will be saved in the same directory as the source file.
* `-Format`: Specifies the desired target format for the converted file. This parameter is optional.

#### Usage Examples

```PowerShell
# Converts an .mvk file to .mp4 and saves in the same directory
Convert-MediaFile -File "Path/to/source/file.mvk" -Out "Path/to/output/file.mp4"

# Converts an .mp3 file to .wav and saves in the same directory
Convert-MediaFile -File "Path/to/source/file.mp3" -Format "wav"
```

## Project Roadmap

### Tasks and Objectives

| Task                                     | Description                                              | Status      |
| ---------------------------------------- | -------------------------------------------------------- | ----------- |
| Add support for more media formats       | Expand support for additional video and audio extensions | In Progress |
| Enhance conversion logic                 | Improve conversion algorithms for better performance     | Planned     |
| Implement advanced configuration options | Allow users to customize conversion settings             | Planned     |
| Update documentation                     | Keep documentation up-to-date with new features          | In Progress |


### Audio Compatibility Matrix

| Formato de Origem | .mp3 | .wav | .aac | .ogg | .flac | .m4a | .wma | .aiff | .alac | .amr |
| ----------------- | ---- | ---- | ---- | ---- | ----- | ---- | ---- | ----- | ----- | ---- |
| .mp3              |      |      |      |      |       |      | ✓    |       |       |      |
| .wav              |      |      |      |      |       |      |      |       |       |      |
| .aac              |      |      |      |      |       |      |      |       |       |      |
| .ogg              |      |      |      |      |       |      |      |       |       |      |
| .flac             |      |      |      |      |       |      |      |       |       |      |
| .m4a              |      |      |      |      |       |      |      |       |       |      |
| .wma              |      |      |      |      |       |      |      |       |       |      |
| .aiff             |      |      |      |      |       |      |      |       |       |      |
| .alac             |      |      |      |      |       |      |      |       |       |      |
| .amr              |      |      |      |      |       |      |      |       |       |      |

### Video Compatibility Matrix

| Formato de Origem | .mp4 | .mkv | .avi | .mov | .wmv | .flv | .webm | .mpeg | .3gp | .m4v |
| ----------------- | ---- | ---- | ---- | ---- | ---- | ---- | ----- | ----- | ---- | ---- |
| .mp4              |      |      |      |      |      |      |       |       |      |      |
| .mkv              | ✓    |      |      |      |      |      |       |       |      |      |
| .avi              |      |      |      |      |      |      |       |       |      |      |
| .mov              |      |      |      |      |      |      |       |       |      |      |
| .wmv              |      |      |      |      |      |      |       |       |      |      |
| .flv              |      |      |      |      |      |      |       |       |      |      |
| .webm             |      |      |      |      |      |      |       |       |      |      |
| .mpeg             |      |      |      |      |      |      |       |       |      |      |


## Contributing

We welcome contributions from the community to help improve MediaConverter. If you have any suggestions, feature requests, or bug reports, please feel free to submit a pull request or open an issue on the [GitHub repository]().

## License

This project is licensed under the MIT License. See the [LICENSE]() file for more information.


