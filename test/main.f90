program main
    use assert_doesnt_include_test, only: &
            assert_doesnt_include_assert_includes => test_assert_includes
    use assert_empty_test, only: &
            assert_empty_assert_empty => test_assert_empty
    use assert_equals_double_precision_test, only: &
            assert_equals_double_precision_assert_equals_integers => test_assert_equals_integers
    use assert_equals_integers_test, only: &
            assert_equals_integers_assert_equals_integers => test_assert_equals_integers
    use assert_equals_strings_test, only: &
            assert_equals_strings_assert_equals_strings => test_assert_equals_strings
    use assert_equals_within_absolute_test, only: &
            assert_equals_within_absolute_assert_equals_within_relative => test_assert_equals_within_relative
    use assert_equals_within_relative_test, only: &
            assert_equals_within_relative_assert_equals_within_relative => test_assert_equals_within_relative
    use assert_includes_test, only: &
            assert_includes_assert_includes => test_assert_includes
    use collection_properties_test, only: &
            collection_properties_collection_properties => test_collection_properties
    use failing_case_test, only: &
            failing_case_failing_case_behaviors => test_failing_case_behaviors
    use failing_collection_test, only: &
            failing_collection_failing_collection_behaviors => test_failing_collection_behaviors
    use filter_test, only: &
            filter_filter_case => test_filter_case, &
            filter_filter_collection => test_filter_collection
    use passing_case_test, only: &
            passing_case_passing_case_behaviors => test_passing_case_behaviors
    use passing_collection_test, only: &
            passing_collection_passing_collection_behaviors => test_passing_collection_behaviors
    use result_test, only: &
            result_result => test_result
    use single_case_properties_test, only: &
            single_case_properties_case_properties => test_case_properties
    use Vegetables_m, only: TestItem_t, testThat, runTests

    implicit none

    call run()
contains
    subroutine run()
        type(TestItem_t) :: tests
        type(TestItem_t) :: individual_tests(17)

        individual_tests(1) = assert_doesnt_include_assert_includes()
        individual_tests(2) = assert_empty_assert_empty()
        individual_tests(3) = assert_equals_double_precision_assert_equals_integers()
        individual_tests(4) = assert_equals_integers_assert_equals_integers()
        individual_tests(5) = assert_equals_strings_assert_equals_strings()
        individual_tests(6) = assert_equals_within_absolute_assert_equals_within_relative()
        individual_tests(7) = assert_equals_within_relative_assert_equals_within_relative()
        individual_tests(8) = assert_includes_assert_includes()
        individual_tests(9) = collection_properties_collection_properties()
        individual_tests(10) = failing_case_failing_case_behaviors()
        individual_tests(11) = failing_collection_failing_collection_behaviors()
        individual_tests(12) = filter_filter_case()
        individual_tests(13) = filter_filter_collection()
        individual_tests(14) = passing_case_passing_case_behaviors()
        individual_tests(15) = passing_collection_passing_collection_behaviors()
        individual_tests(16) = result_result()
        individual_tests(17) = single_case_properties_case_properties()
        tests = testThat(individual_tests)

        call runTests(tests)
    end subroutine run
end program
