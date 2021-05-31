"""
@generated
cargo-raze generated Bazel file.

DO NOT EDIT! Replaced on runs of cargo-raze
"""

load("@bazel_tools//tools/build_defs/repo:git.bzl", "new_git_repository")  # buildifier: disable=load
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")  # buildifier: disable=load
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")  # buildifier: disable=load

def raze_fetch_remote_crates():
    """This function defines a collection of repos and should be called in a WORKSPACE file"""
    maybe(
        http_archive,
        name = "raze__actix_codec__0_3_0",
        url = "https://crates.io/api/v1/crates/actix-codec/0.3.0/download",
        type = "tar.gz",
        sha256 = "78d1833b3838dbe990df0f1f87baf640cf6146e898166afe401839d1b001e570",
        strip_prefix = "actix-codec-0.3.0",
        build_file = Label("//cargo/remote:BUILD.actix-codec-0.3.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__actix_connect__2_0_0",
        url = "https://crates.io/api/v1/crates/actix-connect/2.0.0/download",
        type = "tar.gz",
        sha256 = "177837a10863f15ba8d3ae3ec12fac1099099529ed20083a27fdfe247381d0dc",
        strip_prefix = "actix-connect-2.0.0",
        build_file = Label("//cargo/remote:BUILD.actix-connect-2.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__actix_http__2_2_0",
        url = "https://crates.io/api/v1/crates/actix-http/2.2.0/download",
        type = "tar.gz",
        sha256 = "452299e87817ae5673910e53c243484ca38be3828db819b6011736fc6982e874",
        strip_prefix = "actix-http-2.2.0",
        build_file = Label("//cargo/remote:BUILD.actix-http-2.2.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__actix_macros__0_1_3",
        url = "https://crates.io/api/v1/crates/actix-macros/0.1.3/download",
        type = "tar.gz",
        sha256 = "b4ca8ce00b267af8ccebbd647de0d61e0674b6e61185cc7a592ff88772bed655",
        strip_prefix = "actix-macros-0.1.3",
        build_file = Label("//cargo/remote:BUILD.actix-macros-0.1.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__actix_router__0_2_7",
        url = "https://crates.io/api/v1/crates/actix-router/0.2.7/download",
        type = "tar.gz",
        sha256 = "2ad299af73649e1fc893e333ccf86f377751eb95ff875d095131574c6f43452c",
        strip_prefix = "actix-router-0.2.7",
        build_file = Label("//cargo/remote:BUILD.actix-router-0.2.7.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__actix_rt__1_1_1",
        url = "https://crates.io/api/v1/crates/actix-rt/1.1.1/download",
        type = "tar.gz",
        sha256 = "143fcc2912e0d1de2bcf4e2f720d2a60c28652ab4179685a1ee159e0fb3db227",
        strip_prefix = "actix-rt-1.1.1",
        build_file = Label("//cargo/remote:BUILD.actix-rt-1.1.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__actix_server__1_0_4",
        url = "https://crates.io/api/v1/crates/actix-server/1.0.4/download",
        type = "tar.gz",
        sha256 = "45407e6e672ca24784baa667c5d32ef109ccdd8d5e0b5ebb9ef8a67f4dfb708e",
        strip_prefix = "actix-server-1.0.4",
        build_file = Label("//cargo/remote:BUILD.actix-server-1.0.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__actix_service__1_0_6",
        url = "https://crates.io/api/v1/crates/actix-service/1.0.6/download",
        type = "tar.gz",
        sha256 = "0052435d581b5be835d11f4eb3bce417c8af18d87ddf8ace99f8e67e595882bb",
        strip_prefix = "actix-service-1.0.6",
        build_file = Label("//cargo/remote:BUILD.actix-service-1.0.6.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__actix_testing__1_0_1",
        url = "https://crates.io/api/v1/crates/actix-testing/1.0.1/download",
        type = "tar.gz",
        sha256 = "47239ca38799ab74ee6a8a94d1ce857014b2ac36f242f70f3f75a66f691e791c",
        strip_prefix = "actix-testing-1.0.1",
        build_file = Label("//cargo/remote:BUILD.actix-testing-1.0.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__actix_threadpool__0_3_3",
        url = "https://crates.io/api/v1/crates/actix-threadpool/0.3.3/download",
        type = "tar.gz",
        sha256 = "d209f04d002854b9afd3743032a27b066158817965bf5d036824d19ac2cc0e30",
        strip_prefix = "actix-threadpool-0.3.3",
        build_file = Label("//cargo/remote:BUILD.actix-threadpool-0.3.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__actix_tls__2_0_0",
        url = "https://crates.io/api/v1/crates/actix-tls/2.0.0/download",
        type = "tar.gz",
        sha256 = "24789b7d7361cf5503a504ebe1c10806896f61e96eca9a7350e23001aca715fb",
        strip_prefix = "actix-tls-2.0.0",
        build_file = Label("//cargo/remote:BUILD.actix-tls-2.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__actix_utils__2_0_0",
        url = "https://crates.io/api/v1/crates/actix-utils/2.0.0/download",
        type = "tar.gz",
        sha256 = "2e9022dec56632d1d7979e59af14f0597a28a830a9c1c7fec8b2327eb9f16b5a",
        strip_prefix = "actix-utils-2.0.0",
        build_file = Label("//cargo/remote:BUILD.actix-utils-2.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__actix_web__3_3_2",
        url = "https://crates.io/api/v1/crates/actix-web/3.3.2/download",
        type = "tar.gz",
        sha256 = "e641d4a172e7faa0862241a20ff4f1f5ab0ab7c279f00c2d4587b77483477b86",
        strip_prefix = "actix-web-3.3.2",
        build_file = Label("//cargo/remote:BUILD.actix-web-3.3.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__actix_web_codegen__0_4_0",
        url = "https://crates.io/api/v1/crates/actix-web-codegen/0.4.0/download",
        type = "tar.gz",
        sha256 = "ad26f77093333e0e7c6ffe54ebe3582d908a104e448723eec6d43d08b07143fb",
        strip_prefix = "actix-web-codegen-0.4.0",
        build_file = Label("//cargo/remote:BUILD.actix-web-codegen-0.4.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__adler__1_0_2",
        url = "https://crates.io/api/v1/crates/adler/1.0.2/download",
        type = "tar.gz",
        sha256 = "f26201604c87b1e01bd3d98f8d5d9a8fcbb815e8cedb41ffccbeb4bf593a35fe",
        strip_prefix = "adler-1.0.2",
        build_file = Label("//cargo/remote:BUILD.adler-1.0.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__aho_corasick__0_7_18",
        url = "https://crates.io/api/v1/crates/aho-corasick/0.7.18/download",
        type = "tar.gz",
        sha256 = "1e37cfd5e7657ada45f742d6e99ca5788580b5c529dc78faf11ece6dc702656f",
        strip_prefix = "aho-corasick-0.7.18",
        build_file = Label("//cargo/remote:BUILD.aho-corasick-0.7.18.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__async_trait__0_1_50",
        url = "https://crates.io/api/v1/crates/async-trait/0.1.50/download",
        type = "tar.gz",
        sha256 = "0b98e84bbb4cbcdd97da190ba0c58a1bb0de2c1fdf67d159e192ed766aeca722",
        strip_prefix = "async-trait-0.1.50",
        build_file = Label("//cargo/remote:BUILD.async-trait-0.1.50.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__autocfg__1_0_1",
        url = "https://crates.io/api/v1/crates/autocfg/1.0.1/download",
        type = "tar.gz",
        sha256 = "cdb031dd78e28731d87d56cc8ffef4a8f36ca26c38fe2de700543e627f8a464a",
        strip_prefix = "autocfg-1.0.1",
        build_file = Label("//cargo/remote:BUILD.autocfg-1.0.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__awc__2_0_3",
        url = "https://crates.io/api/v1/crates/awc/2.0.3/download",
        type = "tar.gz",
        sha256 = "b381e490e7b0cfc37ebc54079b0413d8093ef43d14a4e4747083f7fa47a9e691",
        strip_prefix = "awc-2.0.3",
        build_file = Label("//cargo/remote:BUILD.awc-2.0.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__base_x__0_2_8",
        url = "https://crates.io/api/v1/crates/base-x/0.2.8/download",
        type = "tar.gz",
        sha256 = "a4521f3e3d031370679b3b140beb36dfe4801b09ac77e30c61941f97df3ef28b",
        strip_prefix = "base-x-0.2.8",
        build_file = Label("//cargo/remote:BUILD.base-x-0.2.8.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__base64__0_13_0",
        url = "https://crates.io/api/v1/crates/base64/0.13.0/download",
        type = "tar.gz",
        sha256 = "904dfeac50f3cdaba28fc6f57fdcddb75f49ed61346676a78c4ffe55877802fd",
        strip_prefix = "base64-0.13.0",
        build_file = Label("//cargo/remote:BUILD.base64-0.13.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__bitflags__1_2_1",
        url = "https://crates.io/api/v1/crates/bitflags/1.2.1/download",
        type = "tar.gz",
        sha256 = "cf1de2fe8c75bc145a2f577add951f8134889b4795d47466a54a5c846d691693",
        strip_prefix = "bitflags-1.2.1",
        build_file = Label("//cargo/remote:BUILD.bitflags-1.2.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__block_buffer__0_9_0",
        url = "https://crates.io/api/v1/crates/block-buffer/0.9.0/download",
        type = "tar.gz",
        sha256 = "4152116fd6e9dadb291ae18fc1ec3575ed6d84c29642d97890f4b4a3417297e4",
        strip_prefix = "block-buffer-0.9.0",
        build_file = Label("//cargo/remote:BUILD.block-buffer-0.9.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__brotli_sys__0_3_2",
        url = "https://crates.io/api/v1/crates/brotli-sys/0.3.2/download",
        type = "tar.gz",
        sha256 = "4445dea95f4c2b41cde57cc9fee236ae4dbae88d8fcbdb4750fc1bb5d86aaecd",
        strip_prefix = "brotli-sys-0.3.2",
        build_file = Label("//cargo/remote:BUILD.brotli-sys-0.3.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__brotli2__0_3_2",
        url = "https://crates.io/api/v1/crates/brotli2/0.3.2/download",
        type = "tar.gz",
        sha256 = "0cb036c3eade309815c15ddbacec5b22c4d1f3983a774ab2eac2e3e9ea85568e",
        strip_prefix = "brotli2-0.3.2",
        build_file = Label("//cargo/remote:BUILD.brotli2-0.3.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__bumpalo__3_7_0",
        url = "https://crates.io/api/v1/crates/bumpalo/3.7.0/download",
        type = "tar.gz",
        sha256 = "9c59e7af012c713f529e7a3ee57ce9b31ddd858d4b512923602f74608b009631",
        strip_prefix = "bumpalo-3.7.0",
        build_file = Label("//cargo/remote:BUILD.bumpalo-3.7.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__byteorder__1_4_3",
        url = "https://crates.io/api/v1/crates/byteorder/1.4.3/download",
        type = "tar.gz",
        sha256 = "14c189c53d098945499cdfa7ecc63567cf3886b3332b312a5b4585d8d3a6a610",
        strip_prefix = "byteorder-1.4.3",
        build_file = Label("//cargo/remote:BUILD.byteorder-1.4.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__bytes__0_5_6",
        url = "https://crates.io/api/v1/crates/bytes/0.5.6/download",
        type = "tar.gz",
        sha256 = "0e4cec68f03f32e44924783795810fa50a7035d8c8ebe78580ad7e6c703fba38",
        strip_prefix = "bytes-0.5.6",
        build_file = Label("//cargo/remote:BUILD.bytes-0.5.6.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__bytes__1_0_1",
        url = "https://crates.io/api/v1/crates/bytes/1.0.1/download",
        type = "tar.gz",
        sha256 = "b700ce4376041dcd0a327fd0097c41095743c4c8af8887265942faf1100bd040",
        strip_prefix = "bytes-1.0.1",
        build_file = Label("//cargo/remote:BUILD.bytes-1.0.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__bytestring__1_0_0",
        url = "https://crates.io/api/v1/crates/bytestring/1.0.0/download",
        type = "tar.gz",
        sha256 = "90706ba19e97b90786e19dc0d5e2abd80008d99d4c0c5d1ad0b5e72cec7c494d",
        strip_prefix = "bytestring-1.0.0",
        build_file = Label("//cargo/remote:BUILD.bytestring-1.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__cc__1_0_68",
        url = "https://crates.io/api/v1/crates/cc/1.0.68/download",
        type = "tar.gz",
        sha256 = "4a72c244c1ff497a746a7e1fb3d14bd08420ecda70c8f25c7112f2781652d787",
        strip_prefix = "cc-1.0.68",
        build_file = Label("//cargo/remote:BUILD.cc-1.0.68.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__cfg_if__0_1_10",
        url = "https://crates.io/api/v1/crates/cfg-if/0.1.10/download",
        type = "tar.gz",
        sha256 = "4785bdd1c96b2a846b2bd7cc02e86b6b3dbf14e7e53446c4f54c92a361040822",
        strip_prefix = "cfg-if-0.1.10",
        build_file = Label("//cargo/remote:BUILD.cfg-if-0.1.10.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__cfg_if__1_0_0",
        url = "https://crates.io/api/v1/crates/cfg-if/1.0.0/download",
        type = "tar.gz",
        sha256 = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd",
        strip_prefix = "cfg-if-1.0.0",
        build_file = Label("//cargo/remote:BUILD.cfg-if-1.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__const_fn__0_4_8",
        url = "https://crates.io/api/v1/crates/const_fn/0.4.8/download",
        type = "tar.gz",
        sha256 = "f92cfa0fd5690b3cf8c1ef2cabbd9b7ef22fa53cf5e1f92b05103f6d5d1cf6e7",
        strip_prefix = "const_fn-0.4.8",
        build_file = Label("//cargo/remote:BUILD.const_fn-0.4.8.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__convert_case__0_4_0",
        url = "https://crates.io/api/v1/crates/convert_case/0.4.0/download",
        type = "tar.gz",
        sha256 = "6245d59a3e82a7fc217c5828a6692dbc6dfb63a0c8c90495621f7b9d79704a0e",
        strip_prefix = "convert_case-0.4.0",
        build_file = Label("//cargo/remote:BUILD.convert_case-0.4.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__cookie__0_14_4",
        url = "https://crates.io/api/v1/crates/cookie/0.14.4/download",
        type = "tar.gz",
        sha256 = "03a5d7b21829bc7b4bf4754a978a241ae54ea55a40f92bb20216e54096f4b951",
        strip_prefix = "cookie-0.14.4",
        build_file = Label("//cargo/remote:BUILD.cookie-0.14.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__copyless__0_1_5",
        url = "https://crates.io/api/v1/crates/copyless/0.1.5/download",
        type = "tar.gz",
        sha256 = "a2df960f5d869b2dd8532793fde43eb5427cceb126c929747a26823ab0eeb536",
        strip_prefix = "copyless-0.1.5",
        build_file = Label("//cargo/remote:BUILD.copyless-0.1.5.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__cpufeatures__0_1_4",
        url = "https://crates.io/api/v1/crates/cpufeatures/0.1.4/download",
        type = "tar.gz",
        sha256 = "ed00c67cb5d0a7d64a44f6ad2668db7e7530311dd53ea79bcd4fb022c64911c8",
        strip_prefix = "cpufeatures-0.1.4",
        build_file = Label("//cargo/remote:BUILD.cpufeatures-0.1.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__crc32fast__1_2_1",
        url = "https://crates.io/api/v1/crates/crc32fast/1.2.1/download",
        type = "tar.gz",
        sha256 = "81156fece84ab6a9f2afdb109ce3ae577e42b1228441eded99bd77f627953b1a",
        strip_prefix = "crc32fast-1.2.1",
        build_file = Label("//cargo/remote:BUILD.crc32fast-1.2.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__derive_more__0_99_14",
        url = "https://crates.io/api/v1/crates/derive_more/0.99.14/download",
        type = "tar.gz",
        sha256 = "5cc7b9cef1e351660e5443924e4f43ab25fbbed3e9a5f052df3677deb4d6b320",
        strip_prefix = "derive_more-0.99.14",
        build_file = Label("//cargo/remote:BUILD.derive_more-0.99.14.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__digest__0_9_0",
        url = "https://crates.io/api/v1/crates/digest/0.9.0/download",
        type = "tar.gz",
        sha256 = "d3dd60d1080a57a05ab032377049e0591415d2b31afd7028356dbf3cc6dcb066",
        strip_prefix = "digest-0.9.0",
        build_file = Label("//cargo/remote:BUILD.digest-0.9.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__discard__1_0_4",
        url = "https://crates.io/api/v1/crates/discard/1.0.4/download",
        type = "tar.gz",
        sha256 = "212d0f5754cb6769937f4501cc0e67f4f4483c8d2c3e1e922ee9edbe4ab4c7c0",
        strip_prefix = "discard-1.0.4",
        build_file = Label("//cargo/remote:BUILD.discard-1.0.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__either__1_6_1",
        url = "https://crates.io/api/v1/crates/either/1.6.1/download",
        type = "tar.gz",
        sha256 = "e78d4f1cc4ae33bbfc157ed5d5a5ef3bc29227303d595861deb238fcec4e9457",
        strip_prefix = "either-1.6.1",
        build_file = Label("//cargo/remote:BUILD.either-1.6.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__encoding_rs__0_8_28",
        url = "https://crates.io/api/v1/crates/encoding_rs/0.8.28/download",
        type = "tar.gz",
        sha256 = "80df024fbc5ac80f87dfef0d9f5209a252f2a497f7f42944cff24d8253cac065",
        strip_prefix = "encoding_rs-0.8.28",
        build_file = Label("//cargo/remote:BUILD.encoding_rs-0.8.28.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__enum_as_inner__0_3_3",
        url = "https://crates.io/api/v1/crates/enum-as-inner/0.3.3/download",
        type = "tar.gz",
        sha256 = "7c5f0096a91d210159eceb2ff5e1c4da18388a170e1e3ce948aac9c8fdbbf595",
        strip_prefix = "enum-as-inner-0.3.3",
        build_file = Label("//cargo/remote:BUILD.enum-as-inner-0.3.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__flate2__1_0_20",
        url = "https://crates.io/api/v1/crates/flate2/1.0.20/download",
        type = "tar.gz",
        sha256 = "cd3aec53de10fe96d7d8c565eb17f2c687bb5518a2ec453b5b1252964526abe0",
        strip_prefix = "flate2-1.0.20",
        build_file = Label("//cargo/remote:BUILD.flate2-1.0.20.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__fnv__1_0_7",
        url = "https://crates.io/api/v1/crates/fnv/1.0.7/download",
        type = "tar.gz",
        sha256 = "3f9eec918d3f24069decb9af1554cad7c880e2da24a9afd88aca000531ab82c1",
        strip_prefix = "fnv-1.0.7",
        build_file = Label("//cargo/remote:BUILD.fnv-1.0.7.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__form_urlencoded__1_0_1",
        url = "https://crates.io/api/v1/crates/form_urlencoded/1.0.1/download",
        type = "tar.gz",
        sha256 = "5fc25a87fa4fd2094bffb06925852034d90a17f0d1e05197d4956d3555752191",
        strip_prefix = "form_urlencoded-1.0.1",
        build_file = Label("//cargo/remote:BUILD.form_urlencoded-1.0.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__fuchsia_zircon__0_3_3",
        url = "https://crates.io/api/v1/crates/fuchsia-zircon/0.3.3/download",
        type = "tar.gz",
        sha256 = "2e9763c69ebaae630ba35f74888db465e49e259ba1bc0eda7d06f4a067615d82",
        strip_prefix = "fuchsia-zircon-0.3.3",
        build_file = Label("//cargo/remote:BUILD.fuchsia-zircon-0.3.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__fuchsia_zircon_sys__0_3_3",
        url = "https://crates.io/api/v1/crates/fuchsia-zircon-sys/0.3.3/download",
        type = "tar.gz",
        sha256 = "3dcaa9ae7725d12cdb85b3ad99a434db70b468c09ded17e012d86b5c1010f7a7",
        strip_prefix = "fuchsia-zircon-sys-0.3.3",
        build_file = Label("//cargo/remote:BUILD.fuchsia-zircon-sys-0.3.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__futures__0_3_15",
        url = "https://crates.io/api/v1/crates/futures/0.3.15/download",
        type = "tar.gz",
        sha256 = "0e7e43a803dae2fa37c1f6a8fe121e1f7bf9548b4dfc0522a42f34145dadfc27",
        strip_prefix = "futures-0.3.15",
        build_file = Label("//cargo/remote:BUILD.futures-0.3.15.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__futures_channel__0_3_15",
        url = "https://crates.io/api/v1/crates/futures-channel/0.3.15/download",
        type = "tar.gz",
        sha256 = "e682a68b29a882df0545c143dc3646daefe80ba479bcdede94d5a703de2871e2",
        strip_prefix = "futures-channel-0.3.15",
        build_file = Label("//cargo/remote:BUILD.futures-channel-0.3.15.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__futures_core__0_3_15",
        url = "https://crates.io/api/v1/crates/futures-core/0.3.15/download",
        type = "tar.gz",
        sha256 = "0402f765d8a89a26043b889b26ce3c4679d268fa6bb22cd7c6aad98340e179d1",
        strip_prefix = "futures-core-0.3.15",
        build_file = Label("//cargo/remote:BUILD.futures-core-0.3.15.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__futures_io__0_3_15",
        url = "https://crates.io/api/v1/crates/futures-io/0.3.15/download",
        type = "tar.gz",
        sha256 = "acc499defb3b348f8d8f3f66415835a9131856ff7714bf10dadfc4ec4bdb29a1",
        strip_prefix = "futures-io-0.3.15",
        build_file = Label("//cargo/remote:BUILD.futures-io-0.3.15.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__futures_macro__0_3_15",
        url = "https://crates.io/api/v1/crates/futures-macro/0.3.15/download",
        type = "tar.gz",
        sha256 = "a4c40298486cdf52cc00cd6d6987892ba502c7656a16a4192a9992b1ccedd121",
        strip_prefix = "futures-macro-0.3.15",
        build_file = Label("//cargo/remote:BUILD.futures-macro-0.3.15.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__futures_sink__0_3_15",
        url = "https://crates.io/api/v1/crates/futures-sink/0.3.15/download",
        type = "tar.gz",
        sha256 = "a57bead0ceff0d6dde8f465ecd96c9338121bb7717d3e7b108059531870c4282",
        strip_prefix = "futures-sink-0.3.15",
        build_file = Label("//cargo/remote:BUILD.futures-sink-0.3.15.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__futures_task__0_3_15",
        url = "https://crates.io/api/v1/crates/futures-task/0.3.15/download",
        type = "tar.gz",
        sha256 = "8a16bef9fc1a4dddb5bee51c989e3fbba26569cbb0e31f5b303c184e3dd33dae",
        strip_prefix = "futures-task-0.3.15",
        build_file = Label("//cargo/remote:BUILD.futures-task-0.3.15.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__futures_util__0_3_15",
        url = "https://crates.io/api/v1/crates/futures-util/0.3.15/download",
        type = "tar.gz",
        sha256 = "feb5c238d27e2bf94ffdfd27b2c29e3df4a68c4193bb6427384259e2bf191967",
        strip_prefix = "futures-util-0.3.15",
        build_file = Label("//cargo/remote:BUILD.futures-util-0.3.15.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__fxhash__0_2_1",
        url = "https://crates.io/api/v1/crates/fxhash/0.2.1/download",
        type = "tar.gz",
        sha256 = "c31b6d751ae2c7f11320402d34e41349dd1016f8d5d45e48c4312bc8625af50c",
        strip_prefix = "fxhash-0.2.1",
        build_file = Label("//cargo/remote:BUILD.fxhash-0.2.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__generic_array__0_14_4",
        url = "https://crates.io/api/v1/crates/generic-array/0.14.4/download",
        type = "tar.gz",
        sha256 = "501466ecc8a30d1d3b7fc9229b122b2ce8ed6e9d9223f1138d4babb253e51817",
        strip_prefix = "generic-array-0.14.4",
        build_file = Label("//cargo/remote:BUILD.generic-array-0.14.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__getrandom__0_1_16",
        url = "https://crates.io/api/v1/crates/getrandom/0.1.16/download",
        type = "tar.gz",
        sha256 = "8fc3cb4d91f53b50155bdcfd23f6a4c39ae1969c2ae85982b135750cccaf5fce",
        strip_prefix = "getrandom-0.1.16",
        build_file = Label("//cargo/remote:BUILD.getrandom-0.1.16.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__h2__0_2_7",
        url = "https://crates.io/api/v1/crates/h2/0.2.7/download",
        type = "tar.gz",
        sha256 = "5e4728fd124914ad25e99e3d15a9361a879f6620f63cb56bbb08f95abb97a535",
        strip_prefix = "h2-0.2.7",
        build_file = Label("//cargo/remote:BUILD.h2-0.2.7.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__hashbrown__0_9_1",
        url = "https://crates.io/api/v1/crates/hashbrown/0.9.1/download",
        type = "tar.gz",
        sha256 = "d7afe4a420e3fe79967a00898cc1f4db7c8a49a9333a29f8a4bd76a253d5cd04",
        strip_prefix = "hashbrown-0.9.1",
        build_file = Label("//cargo/remote:BUILD.hashbrown-0.9.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__heck__0_3_2",
        url = "https://crates.io/api/v1/crates/heck/0.3.2/download",
        type = "tar.gz",
        sha256 = "87cbf45460356b7deeb5e3415b5563308c0a9b057c85e12b06ad551f98d0a6ac",
        strip_prefix = "heck-0.3.2",
        build_file = Label("//cargo/remote:BUILD.heck-0.3.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__hermit_abi__0_1_18",
        url = "https://crates.io/api/v1/crates/hermit-abi/0.1.18/download",
        type = "tar.gz",
        sha256 = "322f4de77956e22ed0e5032c359a0f1273f1f7f0d79bfa3b8ffbc730d7fbcc5c",
        strip_prefix = "hermit-abi-0.1.18",
        build_file = Label("//cargo/remote:BUILD.hermit-abi-0.1.18.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__hostname__0_3_1",
        url = "https://crates.io/api/v1/crates/hostname/0.3.1/download",
        type = "tar.gz",
        sha256 = "3c731c3e10504cc8ed35cfe2f1db4c9274c3d35fa486e3b31df46f068ef3e867",
        strip_prefix = "hostname-0.3.1",
        build_file = Label("//cargo/remote:BUILD.hostname-0.3.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__http__0_2_4",
        url = "https://crates.io/api/v1/crates/http/0.2.4/download",
        type = "tar.gz",
        sha256 = "527e8c9ac747e28542699a951517aa9a6945af506cd1f2e1b53a576c17b6cc11",
        strip_prefix = "http-0.2.4",
        build_file = Label("//cargo/remote:BUILD.http-0.2.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__httparse__1_4_1",
        url = "https://crates.io/api/v1/crates/httparse/1.4.1/download",
        type = "tar.gz",
        sha256 = "f3a87b616e37e93c22fb19bcd386f02f3af5ea98a25670ad0fce773de23c5e68",
        strip_prefix = "httparse-1.4.1",
        build_file = Label("//cargo/remote:BUILD.httparse-1.4.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__idna__0_2_3",
        url = "https://crates.io/api/v1/crates/idna/0.2.3/download",
        type = "tar.gz",
        sha256 = "418a0a6fab821475f634efe3ccc45c013f742efe03d853e8d3355d5cb850ecf8",
        strip_prefix = "idna-0.2.3",
        build_file = Label("//cargo/remote:BUILD.idna-0.2.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__indexmap__1_6_2",
        url = "https://crates.io/api/v1/crates/indexmap/1.6.2/download",
        type = "tar.gz",
        sha256 = "824845a0bf897a9042383849b02c1bc219c2383772efcd5c6f9766fa4b81aef3",
        strip_prefix = "indexmap-1.6.2",
        build_file = Label("//cargo/remote:BUILD.indexmap-1.6.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__instant__0_1_9",
        url = "https://crates.io/api/v1/crates/instant/0.1.9/download",
        type = "tar.gz",
        sha256 = "61124eeebbd69b8190558df225adf7e4caafce0d743919e5d6b19652314ec5ec",
        strip_prefix = "instant-0.1.9",
        build_file = Label("//cargo/remote:BUILD.instant-0.1.9.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__iovec__0_1_4",
        url = "https://crates.io/api/v1/crates/iovec/0.1.4/download",
        type = "tar.gz",
        sha256 = "b2b3ea6ff95e175473f8ffe6a7eb7c00d054240321b84c57051175fe3c1e075e",
        strip_prefix = "iovec-0.1.4",
        build_file = Label("//cargo/remote:BUILD.iovec-0.1.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__ipconfig__0_2_2",
        url = "https://crates.io/api/v1/crates/ipconfig/0.2.2/download",
        type = "tar.gz",
        sha256 = "f7e2f18aece9709094573a9f24f483c4f65caa4298e2f7ae1b71cc65d853fad7",
        strip_prefix = "ipconfig-0.2.2",
        build_file = Label("//cargo/remote:BUILD.ipconfig-0.2.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__itoa__0_4_7",
        url = "https://crates.io/api/v1/crates/itoa/0.4.7/download",
        type = "tar.gz",
        sha256 = "dd25036021b0de88a0aff6b850051563c6516d0bf53f8638938edbb9de732736",
        strip_prefix = "itoa-0.4.7",
        build_file = Label("//cargo/remote:BUILD.itoa-0.4.7.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__kernel32_sys__0_2_2",
        url = "https://crates.io/api/v1/crates/kernel32-sys/0.2.2/download",
        type = "tar.gz",
        sha256 = "7507624b29483431c0ba2d82aece8ca6cdba9382bff4ddd0f7490560c056098d",
        strip_prefix = "kernel32-sys-0.2.2",
        build_file = Label("//cargo/remote:BUILD.kernel32-sys-0.2.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__language_tags__0_2_2",
        url = "https://crates.io/api/v1/crates/language-tags/0.2.2/download",
        type = "tar.gz",
        sha256 = "a91d884b6667cd606bb5a69aa0c99ba811a115fc68915e7056ec08a46e93199a",
        strip_prefix = "language-tags-0.2.2",
        build_file = Label("//cargo/remote:BUILD.language-tags-0.2.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__lazy_static__1_4_0",
        url = "https://crates.io/api/v1/crates/lazy_static/1.4.0/download",
        type = "tar.gz",
        sha256 = "e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646",
        strip_prefix = "lazy_static-1.4.0",
        build_file = Label("//cargo/remote:BUILD.lazy_static-1.4.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__libc__0_2_95",
        url = "https://crates.io/api/v1/crates/libc/0.2.95/download",
        type = "tar.gz",
        sha256 = "789da6d93f1b866ffe175afc5322a4d76c038605a1c3319bb57b06967ca98a36",
        strip_prefix = "libc-0.2.95",
        build_file = Label("//cargo/remote:BUILD.libc-0.2.95.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__linked_hash_map__0_5_4",
        url = "https://crates.io/api/v1/crates/linked-hash-map/0.5.4/download",
        type = "tar.gz",
        sha256 = "7fb9b38af92608140b86b693604b9ffcc5824240a484d1ecd4795bacb2fe88f3",
        strip_prefix = "linked-hash-map-0.5.4",
        build_file = Label("//cargo/remote:BUILD.linked-hash-map-0.5.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__lock_api__0_4_4",
        url = "https://crates.io/api/v1/crates/lock_api/0.4.4/download",
        type = "tar.gz",
        sha256 = "0382880606dff6d15c9476c416d18690b72742aa7b605bb6dd6ec9030fbf07eb",
        strip_prefix = "lock_api-0.4.4",
        build_file = Label("//cargo/remote:BUILD.lock_api-0.4.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__log__0_4_14",
        url = "https://crates.io/api/v1/crates/log/0.4.14/download",
        type = "tar.gz",
        sha256 = "51b9bbe6c47d51fc3e1a9b945965946b4c44142ab8792c50835a980d362c2710",
        strip_prefix = "log-0.4.14",
        build_file = Label("//cargo/remote:BUILD.log-0.4.14.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__lru_cache__0_1_2",
        url = "https://crates.io/api/v1/crates/lru-cache/0.1.2/download",
        type = "tar.gz",
        sha256 = "31e24f1ad8321ca0e8a1e0ac13f23cb668e6f5466c2c57319f6a5cf1cc8e3b1c",
        strip_prefix = "lru-cache-0.1.2",
        build_file = Label("//cargo/remote:BUILD.lru-cache-0.1.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__match_cfg__0_1_0",
        url = "https://crates.io/api/v1/crates/match_cfg/0.1.0/download",
        type = "tar.gz",
        sha256 = "ffbee8634e0d45d258acb448e7eaab3fce7a0a467395d4d9f228e3c1f01fb2e4",
        strip_prefix = "match_cfg-0.1.0",
        build_file = Label("//cargo/remote:BUILD.match_cfg-0.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__matches__0_1_8",
        url = "https://crates.io/api/v1/crates/matches/0.1.8/download",
        type = "tar.gz",
        sha256 = "7ffc5c5338469d4d3ea17d269fa8ea3512ad247247c30bd2df69e68309ed0a08",
        strip_prefix = "matches-0.1.8",
        build_file = Label("//cargo/remote:BUILD.matches-0.1.8.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__memchr__2_4_0",
        url = "https://crates.io/api/v1/crates/memchr/2.4.0/download",
        type = "tar.gz",
        sha256 = "b16bd47d9e329435e309c58469fe0791c2d0d1ba96ec0954152a5ae2b04387dc",
        strip_prefix = "memchr-2.4.0",
        build_file = Label("//cargo/remote:BUILD.memchr-2.4.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__mime__0_3_16",
        url = "https://crates.io/api/v1/crates/mime/0.3.16/download",
        type = "tar.gz",
        sha256 = "2a60c7ce501c71e03a9c9c0d35b861413ae925bd979cc7a4e30d060069aaac8d",
        strip_prefix = "mime-0.3.16",
        build_file = Label("//cargo/remote:BUILD.mime-0.3.16.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__miniz_oxide__0_4_4",
        url = "https://crates.io/api/v1/crates/miniz_oxide/0.4.4/download",
        type = "tar.gz",
        sha256 = "a92518e98c078586bc6c934028adcca4c92a53d6a958196de835170a01d84e4b",
        strip_prefix = "miniz_oxide-0.4.4",
        build_file = Label("//cargo/remote:BUILD.miniz_oxide-0.4.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__mio__0_6_23",
        url = "https://crates.io/api/v1/crates/mio/0.6.23/download",
        type = "tar.gz",
        sha256 = "4afd66f5b91bf2a3bc13fad0e21caedac168ca4c707504e75585648ae80e4cc4",
        strip_prefix = "mio-0.6.23",
        build_file = Label("//cargo/remote:BUILD.mio-0.6.23.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__mio_uds__0_6_8",
        url = "https://crates.io/api/v1/crates/mio-uds/0.6.8/download",
        type = "tar.gz",
        sha256 = "afcb699eb26d4332647cc848492bbc15eafb26f08d0304550d5aa1f612e066f0",
        strip_prefix = "mio-uds-0.6.8",
        build_file = Label("//cargo/remote:BUILD.mio-uds-0.6.8.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__miow__0_2_2",
        url = "https://crates.io/api/v1/crates/miow/0.2.2/download",
        type = "tar.gz",
        sha256 = "ebd808424166322d4a38da87083bfddd3ac4c131334ed55856112eb06d46944d",
        strip_prefix = "miow-0.2.2",
        build_file = Label("//cargo/remote:BUILD.miow-0.2.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__net2__0_2_37",
        url = "https://crates.io/api/v1/crates/net2/0.2.37/download",
        type = "tar.gz",
        sha256 = "391630d12b68002ae1e25e8f974306474966550ad82dac6886fb8910c19568ae",
        strip_prefix = "net2-0.2.37",
        build_file = Label("//cargo/remote:BUILD.net2-0.2.37.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__num_cpus__1_13_0",
        url = "https://crates.io/api/v1/crates/num_cpus/1.13.0/download",
        type = "tar.gz",
        sha256 = "05499f3756671c15885fee9034446956fff3f243d6077b91e5767df161f766b3",
        strip_prefix = "num_cpus-1.13.0",
        build_file = Label("//cargo/remote:BUILD.num_cpus-1.13.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__opaque_debug__0_3_0",
        url = "https://crates.io/api/v1/crates/opaque-debug/0.3.0/download",
        type = "tar.gz",
        sha256 = "624a8340c38c1b80fd549087862da4ba43e08858af025b236e509b6649fc13d5",
        strip_prefix = "opaque-debug-0.3.0",
        build_file = Label("//cargo/remote:BUILD.opaque-debug-0.3.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__parking_lot__0_11_1",
        url = "https://crates.io/api/v1/crates/parking_lot/0.11.1/download",
        type = "tar.gz",
        sha256 = "6d7744ac029df22dca6284efe4e898991d28e3085c706c972bcd7da4a27a15eb",
        strip_prefix = "parking_lot-0.11.1",
        build_file = Label("//cargo/remote:BUILD.parking_lot-0.11.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__parking_lot_core__0_8_3",
        url = "https://crates.io/api/v1/crates/parking_lot_core/0.8.3/download",
        type = "tar.gz",
        sha256 = "fa7a782938e745763fe6907fc6ba86946d72f49fe7e21de074e08128a99fb018",
        strip_prefix = "parking_lot_core-0.8.3",
        build_file = Label("//cargo/remote:BUILD.parking_lot_core-0.8.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__percent_encoding__2_1_0",
        url = "https://crates.io/api/v1/crates/percent-encoding/2.1.0/download",
        type = "tar.gz",
        sha256 = "d4fd5641d01c8f18a23da7b6fe29298ff4b55afcccdf78973b24cf3175fee32e",
        strip_prefix = "percent-encoding-2.1.0",
        build_file = Label("//cargo/remote:BUILD.percent-encoding-2.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__pin_project__0_4_28",
        url = "https://crates.io/api/v1/crates/pin-project/0.4.28/download",
        type = "tar.gz",
        sha256 = "918192b5c59119d51e0cd221f4d49dde9112824ba717369e903c97d076083d0f",
        strip_prefix = "pin-project-0.4.28",
        build_file = Label("//cargo/remote:BUILD.pin-project-0.4.28.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__pin_project__1_0_7",
        url = "https://crates.io/api/v1/crates/pin-project/1.0.7/download",
        type = "tar.gz",
        sha256 = "c7509cc106041c40a4518d2af7a61530e1eed0e6285296a3d8c5472806ccc4a4",
        strip_prefix = "pin-project-1.0.7",
        build_file = Label("//cargo/remote:BUILD.pin-project-1.0.7.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__pin_project_internal__0_4_28",
        url = "https://crates.io/api/v1/crates/pin-project-internal/0.4.28/download",
        type = "tar.gz",
        sha256 = "3be26700300be6d9d23264c73211d8190e755b6b5ca7a1b28230025511b52a5e",
        strip_prefix = "pin-project-internal-0.4.28",
        build_file = Label("//cargo/remote:BUILD.pin-project-internal-0.4.28.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__pin_project_internal__1_0_7",
        url = "https://crates.io/api/v1/crates/pin-project-internal/1.0.7/download",
        type = "tar.gz",
        sha256 = "48c950132583b500556b1efd71d45b319029f2b71518d979fcc208e16b42426f",
        strip_prefix = "pin-project-internal-1.0.7",
        build_file = Label("//cargo/remote:BUILD.pin-project-internal-1.0.7.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__pin_project_lite__0_1_12",
        url = "https://crates.io/api/v1/crates/pin-project-lite/0.1.12/download",
        type = "tar.gz",
        sha256 = "257b64915a082f7811703966789728173279bdebb956b143dbcd23f6f970a777",
        strip_prefix = "pin-project-lite-0.1.12",
        build_file = Label("//cargo/remote:BUILD.pin-project-lite-0.1.12.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__pin_project_lite__0_2_6",
        url = "https://crates.io/api/v1/crates/pin-project-lite/0.2.6/download",
        type = "tar.gz",
        sha256 = "dc0e1f259c92177c30a4c9d177246edd0a3568b25756a977d0632cf8fa37e905",
        strip_prefix = "pin-project-lite-0.2.6",
        build_file = Label("//cargo/remote:BUILD.pin-project-lite-0.2.6.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__pin_utils__0_1_0",
        url = "https://crates.io/api/v1/crates/pin-utils/0.1.0/download",
        type = "tar.gz",
        sha256 = "8b870d8c151b6f2fb93e84a13146138f05d02ed11c7e7c54f8826aaaf7c9f184",
        strip_prefix = "pin-utils-0.1.0",
        build_file = Label("//cargo/remote:BUILD.pin-utils-0.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__ppv_lite86__0_2_10",
        url = "https://crates.io/api/v1/crates/ppv-lite86/0.2.10/download",
        type = "tar.gz",
        sha256 = "ac74c624d6b2d21f425f752262f42188365d7b8ff1aff74c82e45136510a4857",
        strip_prefix = "ppv-lite86-0.2.10",
        build_file = Label("//cargo/remote:BUILD.ppv-lite86-0.2.10.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__proc_macro_hack__0_5_19",
        url = "https://crates.io/api/v1/crates/proc-macro-hack/0.5.19/download",
        type = "tar.gz",
        sha256 = "dbf0c48bc1d91375ae5c3cd81e3722dff1abcf81a30960240640d223f59fe0e5",
        strip_prefix = "proc-macro-hack-0.5.19",
        build_file = Label("//cargo/remote:BUILD.proc-macro-hack-0.5.19.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__proc_macro_nested__0_1_7",
        url = "https://crates.io/api/v1/crates/proc-macro-nested/0.1.7/download",
        type = "tar.gz",
        sha256 = "bc881b2c22681370c6a780e47af9840ef841837bc98118431d4e1868bd0c1086",
        strip_prefix = "proc-macro-nested-0.1.7",
        build_file = Label("//cargo/remote:BUILD.proc-macro-nested-0.1.7.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__proc_macro2__1_0_27",
        url = "https://crates.io/api/v1/crates/proc-macro2/1.0.27/download",
        type = "tar.gz",
        sha256 = "f0d8caf72986c1a598726adc988bb5984792ef84f5ee5aa50209145ee8077038",
        strip_prefix = "proc-macro2-1.0.27",
        build_file = Label("//cargo/remote:BUILD.proc-macro2-1.0.27.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__quick_error__1_2_3",
        url = "https://crates.io/api/v1/crates/quick-error/1.2.3/download",
        type = "tar.gz",
        sha256 = "a1d01941d82fa2ab50be1e79e6714289dd7cde78eba4c074bc5a4374f650dfe0",
        strip_prefix = "quick-error-1.2.3",
        build_file = Label("//cargo/remote:BUILD.quick-error-1.2.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__quote__1_0_9",
        url = "https://crates.io/api/v1/crates/quote/1.0.9/download",
        type = "tar.gz",
        sha256 = "c3d0b9745dc2debf507c8422de05d7226cc1f0644216dfdfead988f9b1ab32a7",
        strip_prefix = "quote-1.0.9",
        build_file = Label("//cargo/remote:BUILD.quote-1.0.9.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rand__0_7_3",
        url = "https://crates.io/api/v1/crates/rand/0.7.3/download",
        type = "tar.gz",
        sha256 = "6a6b1679d49b24bbfe0c803429aa1874472f50d9b363131f0e89fc356b544d03",
        strip_prefix = "rand-0.7.3",
        build_file = Label("//cargo/remote:BUILD.rand-0.7.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rand_chacha__0_2_2",
        url = "https://crates.io/api/v1/crates/rand_chacha/0.2.2/download",
        type = "tar.gz",
        sha256 = "f4c8ed856279c9737206bf725bf36935d8666ead7aa69b52be55af369d193402",
        strip_prefix = "rand_chacha-0.2.2",
        build_file = Label("//cargo/remote:BUILD.rand_chacha-0.2.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rand_core__0_5_1",
        url = "https://crates.io/api/v1/crates/rand_core/0.5.1/download",
        type = "tar.gz",
        sha256 = "90bde5296fc891b0cef12a6d03ddccc162ce7b2aff54160af9338f8d40df6d19",
        strip_prefix = "rand_core-0.5.1",
        build_file = Label("//cargo/remote:BUILD.rand_core-0.5.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rand_hc__0_2_0",
        url = "https://crates.io/api/v1/crates/rand_hc/0.2.0/download",
        type = "tar.gz",
        sha256 = "ca3129af7b92a17112d59ad498c6f81eaf463253766b90396d39ea7a39d6613c",
        strip_prefix = "rand_hc-0.2.0",
        build_file = Label("//cargo/remote:BUILD.rand_hc-0.2.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__redox_syscall__0_2_8",
        url = "https://crates.io/api/v1/crates/redox_syscall/0.2.8/download",
        type = "tar.gz",
        sha256 = "742739e41cd49414de871ea5e549afb7e2a3ac77b589bcbebe8c82fab37147fc",
        strip_prefix = "redox_syscall-0.2.8",
        build_file = Label("//cargo/remote:BUILD.redox_syscall-0.2.8.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__regex__1_5_4",
        url = "https://crates.io/api/v1/crates/regex/1.5.4/download",
        type = "tar.gz",
        sha256 = "d07a8629359eb56f1e2fb1652bb04212c072a87ba68546a04065d525673ac461",
        strip_prefix = "regex-1.5.4",
        build_file = Label("//cargo/remote:BUILD.regex-1.5.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__regex_syntax__0_6_25",
        url = "https://crates.io/api/v1/crates/regex-syntax/0.6.25/download",
        type = "tar.gz",
        sha256 = "f497285884f3fcff424ffc933e56d7cbca511def0c9831a7f9b5f6153e3cc89b",
        strip_prefix = "regex-syntax-0.6.25",
        build_file = Label("//cargo/remote:BUILD.regex-syntax-0.6.25.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__resolv_conf__0_7_0",
        url = "https://crates.io/api/v1/crates/resolv-conf/0.7.0/download",
        type = "tar.gz",
        sha256 = "52e44394d2086d010551b14b53b1f24e31647570cd1deb0379e2c21b329aba00",
        strip_prefix = "resolv-conf-0.7.0",
        build_file = Label("//cargo/remote:BUILD.resolv-conf-0.7.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rustc_version__0_2_3",
        url = "https://crates.io/api/v1/crates/rustc_version/0.2.3/download",
        type = "tar.gz",
        sha256 = "138e3e0acb6c9fb258b19b67cb8abd63c00679d2851805ea151465464fe9030a",
        strip_prefix = "rustc_version-0.2.3",
        build_file = Label("//cargo/remote:BUILD.rustc_version-0.2.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__ryu__1_0_5",
        url = "https://crates.io/api/v1/crates/ryu/1.0.5/download",
        type = "tar.gz",
        sha256 = "71d301d4193d031abdd79ff7e3dd721168a9572ef3fe51a1517aba235bd8f86e",
        strip_prefix = "ryu-1.0.5",
        build_file = Label("//cargo/remote:BUILD.ryu-1.0.5.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__scopeguard__1_1_0",
        url = "https://crates.io/api/v1/crates/scopeguard/1.1.0/download",
        type = "tar.gz",
        sha256 = "d29ab0c6d3fc0ee92fe66e2d99f700eab17a8d57d1c1d3b748380fb20baa78cd",
        strip_prefix = "scopeguard-1.1.0",
        build_file = Label("//cargo/remote:BUILD.scopeguard-1.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__semver__0_9_0",
        url = "https://crates.io/api/v1/crates/semver/0.9.0/download",
        type = "tar.gz",
        sha256 = "1d7eb9ef2c18661902cc47e535f9bc51b78acd254da71d375c2f6720d9a40403",
        strip_prefix = "semver-0.9.0",
        build_file = Label("//cargo/remote:BUILD.semver-0.9.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__semver_parser__0_7_0",
        url = "https://crates.io/api/v1/crates/semver-parser/0.7.0/download",
        type = "tar.gz",
        sha256 = "388a1df253eca08550bef6c72392cfe7c30914bf41df5269b68cbd6ff8f570a3",
        strip_prefix = "semver-parser-0.7.0",
        build_file = Label("//cargo/remote:BUILD.semver-parser-0.7.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__serde__1_0_126",
        url = "https://crates.io/api/v1/crates/serde/1.0.126/download",
        type = "tar.gz",
        sha256 = "ec7505abeacaec74ae4778d9d9328fe5a5d04253220a85c4ee022239fc996d03",
        strip_prefix = "serde-1.0.126",
        build_file = Label("//cargo/remote:BUILD.serde-1.0.126.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__serde_derive__1_0_126",
        url = "https://crates.io/api/v1/crates/serde_derive/1.0.126/download",
        type = "tar.gz",
        sha256 = "963a7dbc9895aeac7ac90e74f34a5d5261828f79df35cbed41e10189d3804d43",
        strip_prefix = "serde_derive-1.0.126",
        build_file = Label("//cargo/remote:BUILD.serde_derive-1.0.126.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__serde_json__1_0_64",
        url = "https://crates.io/api/v1/crates/serde_json/1.0.64/download",
        type = "tar.gz",
        sha256 = "799e97dc9fdae36a5c8b8f2cae9ce2ee9fdce2058c57a93e6099d919fd982f79",
        strip_prefix = "serde_json-1.0.64",
        build_file = Label("//cargo/remote:BUILD.serde_json-1.0.64.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__serde_urlencoded__0_7_0",
        url = "https://crates.io/api/v1/crates/serde_urlencoded/0.7.0/download",
        type = "tar.gz",
        sha256 = "edfa57a7f8d9c1d260a549e7224100f6c43d43f9103e06dd8b4095a9b2b43ce9",
        strip_prefix = "serde_urlencoded-0.7.0",
        build_file = Label("//cargo/remote:BUILD.serde_urlencoded-0.7.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__sha_1__0_9_6",
        url = "https://crates.io/api/v1/crates/sha-1/0.9.6/download",
        type = "tar.gz",
        sha256 = "8c4cfa741c5832d0ef7fab46cabed29c2aae926db0b11bb2069edd8db5e64e16",
        strip_prefix = "sha-1-0.9.6",
        build_file = Label("//cargo/remote:BUILD.sha-1-0.9.6.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__sha1__0_6_0",
        url = "https://crates.io/api/v1/crates/sha1/0.6.0/download",
        type = "tar.gz",
        sha256 = "2579985fda508104f7587689507983eadd6a6e84dd35d6d115361f530916fa0d",
        strip_prefix = "sha1-0.6.0",
        build_file = Label("//cargo/remote:BUILD.sha1-0.6.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__signal_hook_registry__1_3_0",
        url = "https://crates.io/api/v1/crates/signal-hook-registry/1.3.0/download",
        type = "tar.gz",
        sha256 = "16f1d0fef1604ba8f7a073c7e701f213e056707210e9020af4528e0101ce11a6",
        strip_prefix = "signal-hook-registry-1.3.0",
        build_file = Label("//cargo/remote:BUILD.signal-hook-registry-1.3.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__slab__0_4_3",
        url = "https://crates.io/api/v1/crates/slab/0.4.3/download",
        type = "tar.gz",
        sha256 = "f173ac3d1a7e3b28003f40de0b5ce7fe2710f9b9dc3fc38664cebee46b3b6527",
        strip_prefix = "slab-0.4.3",
        build_file = Label("//cargo/remote:BUILD.slab-0.4.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__smallvec__1_6_1",
        url = "https://crates.io/api/v1/crates/smallvec/1.6.1/download",
        type = "tar.gz",
        sha256 = "fe0f37c9e8f3c5a4a66ad655a93c74daac4ad00c441533bf5c6e7990bb42604e",
        strip_prefix = "smallvec-1.6.1",
        build_file = Label("//cargo/remote:BUILD.smallvec-1.6.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__socket2__0_3_19",
        url = "https://crates.io/api/v1/crates/socket2/0.3.19/download",
        type = "tar.gz",
        sha256 = "122e570113d28d773067fab24266b66753f6ea915758651696b6e35e49f88d6e",
        strip_prefix = "socket2-0.3.19",
        build_file = Label("//cargo/remote:BUILD.socket2-0.3.19.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__standback__0_2_17",
        url = "https://crates.io/api/v1/crates/standback/0.2.17/download",
        type = "tar.gz",
        sha256 = "e113fb6f3de07a243d434a56ec6f186dfd51cb08448239fe7bcae73f87ff28ff",
        strip_prefix = "standback-0.2.17",
        build_file = Label("//cargo/remote:BUILD.standback-0.2.17.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__stdweb__0_4_20",
        url = "https://crates.io/api/v1/crates/stdweb/0.4.20/download",
        type = "tar.gz",
        sha256 = "d022496b16281348b52d0e30ae99e01a73d737b2f45d38fed4edf79f9325a1d5",
        strip_prefix = "stdweb-0.4.20",
        build_file = Label("//cargo/remote:BUILD.stdweb-0.4.20.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__stdweb_derive__0_5_3",
        url = "https://crates.io/api/v1/crates/stdweb-derive/0.5.3/download",
        type = "tar.gz",
        sha256 = "c87a60a40fccc84bef0652345bbbbbe20a605bf5d0ce81719fc476f5c03b50ef",
        strip_prefix = "stdweb-derive-0.5.3",
        build_file = Label("//cargo/remote:BUILD.stdweb-derive-0.5.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__stdweb_internal_macros__0_2_9",
        url = "https://crates.io/api/v1/crates/stdweb-internal-macros/0.2.9/download",
        type = "tar.gz",
        sha256 = "58fa5ff6ad0d98d1ffa8cb115892b6e69d67799f6763e162a1c9db421dc22e11",
        strip_prefix = "stdweb-internal-macros-0.2.9",
        build_file = Label("//cargo/remote:BUILD.stdweb-internal-macros-0.2.9.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__stdweb_internal_runtime__0_1_5",
        url = "https://crates.io/api/v1/crates/stdweb-internal-runtime/0.1.5/download",
        type = "tar.gz",
        sha256 = "213701ba3370744dcd1a12960caa4843b3d68b4d1c0a5d575e0d65b2ee9d16c0",
        strip_prefix = "stdweb-internal-runtime-0.1.5",
        build_file = Label("//cargo/remote:BUILD.stdweb-internal-runtime-0.1.5.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__syn__1_0_72",
        url = "https://crates.io/api/v1/crates/syn/1.0.72/download",
        type = "tar.gz",
        sha256 = "a1e8cdbefb79a9a5a65e0db8b47b723ee907b7c7f8496c76a1770b5c310bab82",
        strip_prefix = "syn-1.0.72",
        build_file = Label("//cargo/remote:BUILD.syn-1.0.72.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__thiserror__1_0_25",
        url = "https://crates.io/api/v1/crates/thiserror/1.0.25/download",
        type = "tar.gz",
        sha256 = "fa6f76457f59514c7eeb4e59d891395fab0b2fd1d40723ae737d64153392e9c6",
        strip_prefix = "thiserror-1.0.25",
        build_file = Label("//cargo/remote:BUILD.thiserror-1.0.25.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__thiserror_impl__1_0_25",
        url = "https://crates.io/api/v1/crates/thiserror-impl/1.0.25/download",
        type = "tar.gz",
        sha256 = "8a36768c0fbf1bb15eca10defa29526bda730a2376c2ab4393ccfa16fb1a318d",
        strip_prefix = "thiserror-impl-1.0.25",
        build_file = Label("//cargo/remote:BUILD.thiserror-impl-1.0.25.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__threadpool__1_8_1",
        url = "https://crates.io/api/v1/crates/threadpool/1.8.1/download",
        type = "tar.gz",
        sha256 = "d050e60b33d41c19108b32cea32164033a9013fe3b46cbd4457559bfbf77afaa",
        strip_prefix = "threadpool-1.8.1",
        build_file = Label("//cargo/remote:BUILD.threadpool-1.8.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__time__0_2_26",
        url = "https://crates.io/api/v1/crates/time/0.2.26/download",
        type = "tar.gz",
        sha256 = "08a8cbfbf47955132d0202d1662f49b2423ae35862aee471f3ba4b133358f372",
        strip_prefix = "time-0.2.26",
        build_file = Label("//cargo/remote:BUILD.time-0.2.26.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__time_macros__0_1_1",
        url = "https://crates.io/api/v1/crates/time-macros/0.1.1/download",
        type = "tar.gz",
        sha256 = "957e9c6e26f12cb6d0dd7fc776bb67a706312e7299aed74c8dd5b17ebb27e2f1",
        strip_prefix = "time-macros-0.1.1",
        build_file = Label("//cargo/remote:BUILD.time-macros-0.1.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__time_macros_impl__0_1_1",
        url = "https://crates.io/api/v1/crates/time-macros-impl/0.1.1/download",
        type = "tar.gz",
        sha256 = "e5c3be1edfad6027c69f5491cf4cb310d1a71ecd6af742788c6ff8bced86b8fa",
        strip_prefix = "time-macros-impl-0.1.1",
        build_file = Label("//cargo/remote:BUILD.time-macros-impl-0.1.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__tinyvec__1_2_0",
        url = "https://crates.io/api/v1/crates/tinyvec/1.2.0/download",
        type = "tar.gz",
        sha256 = "5b5220f05bb7de7f3f53c7c065e1199b3172696fe2db9f9c4d8ad9b4ee74c342",
        strip_prefix = "tinyvec-1.2.0",
        build_file = Label("//cargo/remote:BUILD.tinyvec-1.2.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__tinyvec_macros__0_1_0",
        url = "https://crates.io/api/v1/crates/tinyvec_macros/0.1.0/download",
        type = "tar.gz",
        sha256 = "cda74da7e1a664f795bb1f8a87ec406fb89a02522cf6e50620d016add6dbbf5c",
        strip_prefix = "tinyvec_macros-0.1.0",
        build_file = Label("//cargo/remote:BUILD.tinyvec_macros-0.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__tokio__0_2_25",
        url = "https://crates.io/api/v1/crates/tokio/0.2.25/download",
        type = "tar.gz",
        sha256 = "6703a273949a90131b290be1fe7b039d0fc884aa1935860dfcbe056f28cd8092",
        strip_prefix = "tokio-0.2.25",
        build_file = Label("//cargo/remote:BUILD.tokio-0.2.25.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__tokio_util__0_3_1",
        url = "https://crates.io/api/v1/crates/tokio-util/0.3.1/download",
        type = "tar.gz",
        sha256 = "be8242891f2b6cbef26a2d7e8605133c2c554cd35b3e4948ea892d6d68436499",
        strip_prefix = "tokio-util-0.3.1",
        build_file = Label("//cargo/remote:BUILD.tokio-util-0.3.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__tracing__0_1_26",
        url = "https://crates.io/api/v1/crates/tracing/0.1.26/download",
        type = "tar.gz",
        sha256 = "09adeb8c97449311ccd28a427f96fb563e7fd31aabf994189879d9da2394b89d",
        strip_prefix = "tracing-0.1.26",
        build_file = Label("//cargo/remote:BUILD.tracing-0.1.26.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__tracing_core__0_1_18",
        url = "https://crates.io/api/v1/crates/tracing-core/0.1.18/download",
        type = "tar.gz",
        sha256 = "a9ff14f98b1a4b289c6248a023c1c2fa1491062964e9fed67ab29c4e4da4a052",
        strip_prefix = "tracing-core-0.1.18",
        build_file = Label("//cargo/remote:BUILD.tracing-core-0.1.18.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__tracing_futures__0_2_5",
        url = "https://crates.io/api/v1/crates/tracing-futures/0.2.5/download",
        type = "tar.gz",
        sha256 = "97d095ae15e245a057c8e8451bab9b3ee1e1f68e9ba2b4fbc18d0ac5237835f2",
        strip_prefix = "tracing-futures-0.2.5",
        build_file = Label("//cargo/remote:BUILD.tracing-futures-0.2.5.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__trust_dns_proto__0_19_7",
        url = "https://crates.io/api/v1/crates/trust-dns-proto/0.19.7/download",
        type = "tar.gz",
        sha256 = "1cad71a0c0d68ab9941d2fb6e82f8fb2e86d9945b94e1661dd0aaea2b88215a9",
        strip_prefix = "trust-dns-proto-0.19.7",
        build_file = Label("//cargo/remote:BUILD.trust-dns-proto-0.19.7.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__trust_dns_resolver__0_19_7",
        url = "https://crates.io/api/v1/crates/trust-dns-resolver/0.19.7/download",
        type = "tar.gz",
        sha256 = "710f593b371175db53a26d0b38ed2978fafb9e9e8d3868b1acd753ea18df0ceb",
        strip_prefix = "trust-dns-resolver-0.19.7",
        build_file = Label("//cargo/remote:BUILD.trust-dns-resolver-0.19.7.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__typenum__1_13_0",
        url = "https://crates.io/api/v1/crates/typenum/1.13.0/download",
        type = "tar.gz",
        sha256 = "879f6906492a7cd215bfa4cf595b600146ccfac0c79bcbd1f3000162af5e8b06",
        strip_prefix = "typenum-1.13.0",
        build_file = Label("//cargo/remote:BUILD.typenum-1.13.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__unicode_bidi__0_3_5",
        url = "https://crates.io/api/v1/crates/unicode-bidi/0.3.5/download",
        type = "tar.gz",
        sha256 = "eeb8be209bb1c96b7c177c7420d26e04eccacb0eeae6b980e35fcb74678107e0",
        strip_prefix = "unicode-bidi-0.3.5",
        build_file = Label("//cargo/remote:BUILD.unicode-bidi-0.3.5.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__unicode_normalization__0_1_18",
        url = "https://crates.io/api/v1/crates/unicode-normalization/0.1.18/download",
        type = "tar.gz",
        sha256 = "33717dca7ac877f497014e10d73f3acf948c342bee31b5ca7892faf94ccc6b49",
        strip_prefix = "unicode-normalization-0.1.18",
        build_file = Label("//cargo/remote:BUILD.unicode-normalization-0.1.18.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__unicode_segmentation__1_7_1",
        url = "https://crates.io/api/v1/crates/unicode-segmentation/1.7.1/download",
        type = "tar.gz",
        sha256 = "bb0d2e7be6ae3a5fa87eed5fb451aff96f2573d2694942e40543ae0bbe19c796",
        strip_prefix = "unicode-segmentation-1.7.1",
        build_file = Label("//cargo/remote:BUILD.unicode-segmentation-1.7.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__unicode_xid__0_2_2",
        url = "https://crates.io/api/v1/crates/unicode-xid/0.2.2/download",
        type = "tar.gz",
        sha256 = "8ccb82d61f80a663efe1f787a51b16b5a51e3314d6ac365b08639f52387b33f3",
        strip_prefix = "unicode-xid-0.2.2",
        build_file = Label("//cargo/remote:BUILD.unicode-xid-0.2.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__url__2_2_2",
        url = "https://crates.io/api/v1/crates/url/2.2.2/download",
        type = "tar.gz",
        sha256 = "a507c383b2d33b5fc35d1861e77e6b383d158b2da5e14fe51b83dfedf6fd578c",
        strip_prefix = "url-2.2.2",
        build_file = Label("//cargo/remote:BUILD.url-2.2.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__version_check__0_9_3",
        url = "https://crates.io/api/v1/crates/version_check/0.9.3/download",
        type = "tar.gz",
        sha256 = "5fecdca9a5291cc2b8dcf7dc02453fee791a280f3743cb0905f8822ae463b3fe",
        strip_prefix = "version_check-0.9.3",
        build_file = Label("//cargo/remote:BUILD.version_check-0.9.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wasi__0_9_0_wasi_snapshot_preview1",
        url = "https://crates.io/api/v1/crates/wasi/0.9.0+wasi-snapshot-preview1/download",
        type = "tar.gz",
        sha256 = "cccddf32554fecc6acb585f82a32a72e28b48f8c4c1883ddfeeeaa96f7d8e519",
        strip_prefix = "wasi-0.9.0+wasi-snapshot-preview1",
        build_file = Label("//cargo/remote:BUILD.wasi-0.9.0+wasi-snapshot-preview1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wasm_bindgen__0_2_74",
        url = "https://crates.io/api/v1/crates/wasm-bindgen/0.2.74/download",
        type = "tar.gz",
        sha256 = "d54ee1d4ed486f78874278e63e4069fc1ab9f6a18ca492076ffb90c5eb2997fd",
        strip_prefix = "wasm-bindgen-0.2.74",
        build_file = Label("//cargo/remote:BUILD.wasm-bindgen-0.2.74.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wasm_bindgen_backend__0_2_74",
        url = "https://crates.io/api/v1/crates/wasm-bindgen-backend/0.2.74/download",
        type = "tar.gz",
        sha256 = "3b33f6a0694ccfea53d94db8b2ed1c3a8a4c86dd936b13b9f0a15ec4a451b900",
        strip_prefix = "wasm-bindgen-backend-0.2.74",
        build_file = Label("//cargo/remote:BUILD.wasm-bindgen-backend-0.2.74.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wasm_bindgen_macro__0_2_74",
        url = "https://crates.io/api/v1/crates/wasm-bindgen-macro/0.2.74/download",
        type = "tar.gz",
        sha256 = "088169ca61430fe1e58b8096c24975251700e7b1f6fd91cc9d59b04fb9b18bd4",
        strip_prefix = "wasm-bindgen-macro-0.2.74",
        build_file = Label("//cargo/remote:BUILD.wasm-bindgen-macro-0.2.74.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wasm_bindgen_macro_support__0_2_74",
        url = "https://crates.io/api/v1/crates/wasm-bindgen-macro-support/0.2.74/download",
        type = "tar.gz",
        sha256 = "be2241542ff3d9f241f5e2cb6dd09b37efe786df8851c54957683a49f0987a97",
        strip_prefix = "wasm-bindgen-macro-support-0.2.74",
        build_file = Label("//cargo/remote:BUILD.wasm-bindgen-macro-support-0.2.74.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wasm_bindgen_shared__0_2_74",
        url = "https://crates.io/api/v1/crates/wasm-bindgen-shared/0.2.74/download",
        type = "tar.gz",
        sha256 = "d7cff876b8f18eed75a66cf49b65e7f967cb354a7aa16003fb55dbfd25b44b4f",
        strip_prefix = "wasm-bindgen-shared-0.2.74",
        build_file = Label("//cargo/remote:BUILD.wasm-bindgen-shared-0.2.74.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__widestring__0_4_3",
        url = "https://crates.io/api/v1/crates/widestring/0.4.3/download",
        type = "tar.gz",
        sha256 = "c168940144dd21fd8046987c16a46a33d5fc84eec29ef9dcddc2ac9e31526b7c",
        strip_prefix = "widestring-0.4.3",
        build_file = Label("//cargo/remote:BUILD.widestring-0.4.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__winapi__0_2_8",
        url = "https://crates.io/api/v1/crates/winapi/0.2.8/download",
        type = "tar.gz",
        sha256 = "167dc9d6949a9b857f3451275e911c3f44255842c1f7a76f33c55103a909087a",
        strip_prefix = "winapi-0.2.8",
        build_file = Label("//cargo/remote:BUILD.winapi-0.2.8.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__winapi__0_3_9",
        url = "https://crates.io/api/v1/crates/winapi/0.3.9/download",
        type = "tar.gz",
        sha256 = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419",
        strip_prefix = "winapi-0.3.9",
        build_file = Label("//cargo/remote:BUILD.winapi-0.3.9.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__winapi_build__0_1_1",
        url = "https://crates.io/api/v1/crates/winapi-build/0.1.1/download",
        type = "tar.gz",
        sha256 = "2d315eee3b34aca4797b2da6b13ed88266e6d612562a0c46390af8299fc699bc",
        strip_prefix = "winapi-build-0.1.1",
        build_file = Label("//cargo/remote:BUILD.winapi-build-0.1.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__winapi_i686_pc_windows_gnu__0_4_0",
        url = "https://crates.io/api/v1/crates/winapi-i686-pc-windows-gnu/0.4.0/download",
        type = "tar.gz",
        sha256 = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6",
        strip_prefix = "winapi-i686-pc-windows-gnu-0.4.0",
        build_file = Label("//cargo/remote:BUILD.winapi-i686-pc-windows-gnu-0.4.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__winapi_x86_64_pc_windows_gnu__0_4_0",
        url = "https://crates.io/api/v1/crates/winapi-x86_64-pc-windows-gnu/0.4.0/download",
        type = "tar.gz",
        sha256 = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f",
        strip_prefix = "winapi-x86_64-pc-windows-gnu-0.4.0",
        build_file = Label("//cargo/remote:BUILD.winapi-x86_64-pc-windows-gnu-0.4.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__winreg__0_6_2",
        url = "https://crates.io/api/v1/crates/winreg/0.6.2/download",
        type = "tar.gz",
        sha256 = "b2986deb581c4fe11b621998a5e53361efe6b48a151178d0cd9eeffa4dc6acc9",
        strip_prefix = "winreg-0.6.2",
        build_file = Label("//cargo/remote:BUILD.winreg-0.6.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__ws2_32_sys__0_2_1",
        url = "https://crates.io/api/v1/crates/ws2_32-sys/0.2.1/download",
        type = "tar.gz",
        sha256 = "d59cefebd0c892fa2dd6de581e937301d8552cb44489cdff035c6187cb63fa5e",
        strip_prefix = "ws2_32-sys-0.2.1",
        build_file = Label("//cargo/remote:BUILD.ws2_32-sys-0.2.1.bazel"),
    )
