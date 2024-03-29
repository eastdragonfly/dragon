licenses(["notice"])

package(default_visibility = ["//visibility:public"])

load("//third_party/rules_protobuf/protobuf:rules.bzl", "proto_language", "proto_language_deps")
load("//third_party/rules_protobuf/java:rules.bzl", "java_proto_language_import")

proto_language(
    name = "java",
    grpc_compile_deps = [
        "@io_grpc_grpc_core//jar",
        "@io_grpc_grpc_protobuf//jar",
        "@io_grpc_grpc_stub//jar",
        "@io_grpc_grpc_auth//jar",
        "@com_google_auth_google_auth_library_credentials//jar",
    ],
    grpc_plugin = ":protoc_gen_grpc_java_bin",
    grpc_runtime_deps = [
        "@io_grpc_grpc_netty//jar",
        "@io_grpc_grpc_context//jar",
        "@io_netty_netty_buffer//jar",
        "@io_netty_netty_codec//jar",
        "@io_netty_netty_codec_http2//jar",
        "@io_netty_netty_common//jar",
        "@io_netty_netty_handler//jar",
        "@io_netty_netty_resolver//jar",
        "@io_netty_netty_transport//jar",
        "@io_grpc_grpc_protobuf_lite//jar",
    ],
    output_to_jar = True,
    pb_compile_deps = [
        "@com_google_guava_guava//jar",
        "@com_google_protobuf_protobuf_java//jar",
    ],
    pb_file_extensions = [],
    pb_runtime_deps = [],
    supports_grpc = True,
)

java_proto_language_import(
    name = "grpc_compiletime_deps",
    langs = [":java"],
)

java_proto_language_import(
    name = "netty_runtime_deps",
    langs = [":java"],
    runtime_deps = True,
)

proto_language(
    name = "nano",
    grpc_compile_deps = [
        "@io_grpc_grpc_core//jar",
        "@io_grpc_grpc_protobuf//jar",
        "@io_grpc_grpc_stub//jar",
        "@com_google_protobuf_nano_protobuf_javanano//jar",
        "@io_grpc_grpc_protobuf_nano//jar",
    ],
    grpc_plugin = ":protoc_gen_grpc_java_bin",
    grpc_runtime_deps = [
        "@io_grpc_grpc_netty//jar",
        "@io_grpc_grpc_protobuf_lite//jar",
        "@io_netty_netty_buffer//jar",
        "@io_netty_netty_codec//jar",
        "@io_netty_netty_codec_http2//jar",
        "@io_netty_netty_common//jar",
        "@io_netty_netty_handler//jar",
        "@io_netty_netty_resolver//jar",
        "@io_netty_netty_transport//jar",
    ],
    output_to_jar = True,
    pb_compile_deps = [
        "@com_google_guava_guava//jar",
        "@com_google_protobuf_protobuf_java//jar",
        "@com_google_protobuf_nano_protobuf_javanano//jar",
    ],
    pb_file_extensions = [],
    pb_options = [
        "ignore_services=true",
    ],
    pb_plugin_name = "javanano",
    pb_runtime_deps = [],
    supports_grpc = True,
)

genrule(
    name = "protoc_gen_grpc_java_bin",
    srcs = select({
        ":darwin": ["@protoc_gen_grpc_java_macosx//file"],
        "//conditions:default": ["@protoc_gen_grpc_java_linux_x86_64//file"],
    }),
    outs = ["protoc_gen_grpc_java"],
    cmd = " && ".join([
        "IN=$$(pwd)/$(SRCS)",
        "OUT=$$(pwd)/$@",
        "TMP=$$(mktemp -d $${TMPDIR:-/tmp}/genrule.XXXXXXXXXX)",
        "cd $$TMP",
        "cp $$IN $$OUT",
        "rm -rf $$TMP",
    ]),
    executable = True,
)

config_setting(
    name = "darwin",
    values = {"cpu": "darwin"},
    visibility = ["//visibility:private"],
)
