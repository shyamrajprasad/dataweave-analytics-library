
%dw 2.0
import * from dw::test::Tests
import * from dw::test::Asserts
---
"Test AnalyticsModuleIntegrationMapping" describedBy [
    "Assert AnalyticsModuleIntegrationTestScenario" in do {
        evalPath("AnalyticsModuleIntegrationMapping.dwl", inputsFrom("AnalyticsModuleIntegrationMapping/AnalyticsModuleIntegrationTestScenario"),"application/json") must
                  equalTo(outputFrom("AnalyticsModuleIntegrationMapping/AnalyticsModuleIntegrationTestScenario"))
    }
]
