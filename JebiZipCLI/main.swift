//
//  main.swift
//  JebiZipCLI
//
//  Created by 안창범 on 2019/09/10.
//  Copyright © 2019 Changbeom Ahn. All rights reserved.
//

import Foundation
import JebiZip

debugPrint(CommandLine.argc, CommandLine.arguments)

guard CommandLine.argc > 1 else {
    print("usage:",
          CommandLine.arguments.first.flatMap { URL(fileURLWithPath: $0).lastPathComponent }!,
          "<zip> [<directory>")
    exit(1)
}

let zip = URL(fileURLWithPath: CommandLine.arguments[1])

let directory = URL(fileURLWithPath: CommandLine.argc > 2
    ? CommandLine.arguments.last!
    : FileManager.default.currentDirectoryPath)

debugPrint(zip, directory)

try unzip(zip, to: directory)
