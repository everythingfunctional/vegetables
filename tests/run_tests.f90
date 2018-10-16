program run_tests
    use test_case_test, only: test_can_be_single_case
    use Vegetables_m, only: Test_t, runTests

    implicit none

    class(Test_t), allocatable :: tests

    tests = test_can_be_single_case()
    call runTests(tests)
end program run_tests