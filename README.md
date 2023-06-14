[![Lint and Formatting Checker](https://github.com/robocin/protocols/actions/workflows/lint-and-formatting-checker.yaml/badge.svg?branch=main)](https://github.com/robocin/protocols/actions/workflows/lint-and-formatting-checker.yaml)
[![Ubuntu](https://img.shields.io/badge/Ubuntu-20.04%2B-orange.svg)](https://ubuntu.com/)
[![CMake](https://img.shields.io/badge/CMake-3.16-blue.svg)](https://cmake.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

# RobôCIn Protocols 📦

The RobôCIn Protocols repository is a central hub dedicated to storing and managing protocols that are intended to be
shared across multiple projects. It serves as a reliable source of truth for the latest versions of the protocols
definitions, providing an organized directory structure that categorizes and documents each protobuf file, making it
simple for developers to navigate and understand the available data structures.

By centralizing protocols in a dedicated repository, the RobôCIn team promotes code reuse, modularity, and efficient
development practices. Any updates or modifications to the shared protocols can be made in a controlled manner, ensuring
compatibility across multiple repositories that depend on these protocols.

## Table of Contents

- [About](#about)
    - [Protobufs](#protobufs)
- [Installation](#install)
    - [C++](#cpp)
- [Codemap](#codemap)
- [License](#license)

<a name="about"></a>

## About

The protocols contained in this repository are Protocol Buffers (protobuf).

<a name="protobufs"></a>

### Protobufs

[Protobufs](https://protobuf.dev) are a language-agnostic data serialization format developed by Google, which allow for
efficient and structured communication between different software components. By maintaining a separate repository
solely for protobufs, the RobôCIn team ensures consistency, version control, and easy access to shared data structures
across various projects within the organization.

Protocol Buffers offer numerous advantages, such as efficient serialization, platform independence, and language
interoperability. By using Protocol Buffers, you can easily serialize, deserialize, and exchange structured data between
different systems or languages.

To work with the protocols in this repository, you will need to have Protocol Buffers installed in your development
environment. You can visit the [Protocol Buffers GitHub repository](https://github.com/protocolbuffers/protobuf) for
installation instructions specific to your programming language.

<a name="install"></a>

## Installation

> **Note**: If you intend to utilize this repository on an alternative operating system, please don't hesitate to
> raise an issue. We are committed to providing support and helping you modify the installation process to suit your
> specific OS requirements.

<a name="cpp"></a>

### C++

#### Requirements

- [CMake](https://cmake.org/) 3.16 or above;
- [C++20](https://en.cppreference.com/w/cpp/20) or above:
    - _gcc ≥ 11;_
    - _Some small features used were merged into C++20;_
- [Google Protobuf](https://developers.google.com/protocol-buffers);
    - Protocol Buffers compiler (`protoc`) and the C++ Protocol Buffers runtime library (`libprotobuf`).

#### Steps

To install the project in C++, follow these steps:

1. Clone the repository:

   ```shell
   git clone https://github.com/robocin/protocols.git
   ```

2. Navigate to the project directory:

   ```shell
   cd protocols
   ```

3. Create a build directory and navigate into it:

   ```shell
   mkdir build
   cd build
   ```

4. Configure the project using CMake:

   ```shell
   cmake .. -DCMAKE_INSTALL_PREFIX=/opt/robocin_pb
   ```

   This will generate the necessary build files based on the CMakeLists.txt file present in the repository. We recommend
   installing the project in the `/opt/robocin_pb` to avoid any conflicts with other projects.

5. Build and install the project:

   ```shell
   make -j $(nproc)
   sudo make install -j $(nproc)
   ```

   This command will install the project, placing the necessary files in the appropriate locations.

<a name="codemap"></a>

## Codemap

- [`pb`](robocin/pb/README.md): Contains the protobuf definitions for the RobôCIn Protocols.

<a name="license"></a>

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
