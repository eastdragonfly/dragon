DEPS = {
    # This binds the cc_binary "protoc" into
    # //external:protoc. Required by grpc++.
    "protoc": {
        "rule": "bind",
        "actual": "//third_party/protobuf:protoc",
    },

}
