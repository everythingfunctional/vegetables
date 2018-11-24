module example_cases_m
    implicit none
    private

    character(len=*), parameter, public :: EXAMPLE_DESCRIPTION = "Example Description"

    public :: exampleFailingTestCase, examplePassingTestCase
contains
    function examplePassingTestCase() result(test_case)
        use example_asserts_m, only: exampleMultipleAsserts
        use Vegetables_m, only: TestCase_t, TestCase

        type(TestCase_t) :: test_case

        test_case = TestCase(EXAMPLE_DESCRIPTION, exampleMultipleAsserts)
    end function examplePassingTestCase

    function exampleFailingTestCase() result(test_case)
        use example_asserts_m, only: exampleMultipleAssertsWithFail
        use Vegetables_m, only: TestCase_t, TestCase

        type(TestCase_t) :: test_case

        test_case = TestCase(EXAMPLE_DESCRIPTION, exampleMultipleAssertsWithFail)
    end function exampleFailingTestCase
end module example_cases_m
