%dw 2.0
import * from dw::test::Tests
import * from dw::test::Asserts

import * from AnalyticsModule
---
"AnalyticsModule" describedBy [
    "mean" describedBy [
        "It should do something" in do {
            mean([1,2,3,4]) must beNumber()
        },
    ],
]

