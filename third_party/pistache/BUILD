# https://github.com/oktal/pistache
package(default_visibility = ['//visibility:public'])

licenses(["notice"])

cc_library(
    name = 'pistache',
    srcs = [
     'lib64_release/libpistache.a', 
    ],
    deps = [
      '//third_party/openssl:ssl'
    ],
    hdrs = glob([
        'include/pistache/*.h',
    ]),
    includes = ['include'],
    linkopts = ['-lrt', '-ldl', '-lpthread'],
    alwayslink = True,
)
