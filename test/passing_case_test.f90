module passing_case_test
    use example_asserts_m, only: NUM_ASSERTS_IN_PASSING, SUCCESS_MESSAGE
    use example_cases_m, only: examplePassingTestCase, EXAMPLE_DESCRIPTION
    use Helpers_m, only: TestItemInput_t, TestResultItemInput_t, runTest
    use Vegetables_m, only: &
            Input_t, &
            Result_t, &
            TestItem_t, &
            assertEmpty, &
            assertEquals, &
            assertIncludes, &
            assertThat, &
            fail, &
            Given, &
            Then__, &
            When

    implicit none
    private

    public :: test_passing_case_behaviors
contains
    function test_passing_case_behaviors() result(test)
        type(TestItem_t) :: test

        type(TestItem_t) :: collection(1)
        type(TestItemInput_t) :: the_case
        type(TestItem_t) :: individual_tests(8)

        the_case%input = examplePassingTestCase()
        individual_tests(1) = Then__("it knows it passed", checkCasePasses)
        individual_tests(2) = Then__("it has 1 test case", checkNumCases)
        individual_tests(3) = Then__("it has no failing case", checkNumFailingCases)
        individual_tests(4) = Then__("it's verbose description still includes the given description", checkVerboseDescription)
        individual_tests(5) = Then__("it's verbose description includes the assertion message", checkVerboseDescriptionAssertion)
        individual_tests(6) = Then__("it's failure description is empty", checkFailureDescriptionEmpty)
        individual_tests(7) = Then__("it knows how many asserts there were", checkNumAsserts)
        individual_tests(8) = Then__("it has no failing asserts", checkNumFailingAsserts)
        collection(1) = When("it is run", runTest, individual_tests)
        test = Given("a passing test case", the_case, collection)
    end function test_passing_case_behaviors

    pure function checkCasePasses(example_result) result(result_)
        class(Input_t), intent(in) :: example_result
        type(Result_t) :: result_

        select type (example_result)
        type is (TestResultItemInput_t)
            result_ = assertThat(example_result%input%passed())
        class default
            result_ = fail("Expected to get a TestResultItemInput_t")
        end select
    end function checkCasePasses

    pure function checkNumCases(example_result) result(result_)
        class(Input_t), intent(in) :: example_result
        type(Result_t) :: result_

        select type (example_result)
        type is (TestResultItemInput_t)
            result_ = assertEquals(1, example_result%input%numCases())
        class default
            result_ = fail("Expected to get a TestResultItemInput_t")
        end select
    end function checkNumCases

    pure function checkNumFailingCases(example_result) result(result_)
        class(Input_t), intent(in) :: example_result
        type(Result_t) :: result_

        select type (example_result)
        type is (TestResultItemInput_t)
            result_ = assertEquals(0, example_result%input%numFailingCases())
        class default
            result_ = fail("Expected to get a TestResultItemInput_t")
        end select
    end function checkNumFailingCases

    pure function checkVerboseDescription(example_result) result(result_)
        class(Input_t), intent(in) :: example_result
        type(Result_t) :: result_

        select type (example_result)
        type is (TestResultItemInput_t)
            result_ = assertIncludes(EXAMPLE_DESCRIPTION, example_result%input%verboseDescription(.false.))
        class default
            result_ = fail("Expected to get a TestResultItemInput_t")
        end select
    end function checkVerboseDescription

    pure function checkVerboseDescriptionAssertion(example_result) result(result_)
        class(Input_t), intent(in) :: example_result
        type(Result_t) :: result_

        select type (example_result)
        type is (TestResultItemInput_t)
            result_ = assertIncludes(SUCCESS_MESSAGE, example_result%input%verboseDescription(.false.))
        class default
            result_ = fail("Expected to get a TestResultItemInput_t")
        end select
    end function checkVerboseDescriptionAssertion

    pure function checkFailureDescriptionEmpty(example_result) result(result_)
        class(Input_t), intent(in) :: example_result
        type(Result_t) :: result_

        select type (example_result)
        type is (TestResultItemInput_t)
            result_ = assertEmpty(example_result%input%failureDescription(.false.))
        class default
            result_ = fail("Expected to get a TestResultItemInput_t")
        end select
    end function checkFailureDescriptionEmpty

    pure function checkNumAsserts(example_result) result(result_)
        class(Input_t), intent(in) :: example_result
        type(Result_t) :: result_

        select type (example_result)
        type is (TestResultItemInput_t)
            result_ = assertEquals(NUM_ASSERTS_IN_PASSING, example_result%input%numAsserts())
        class default
            result_ = fail("Expected to get a TestResultItemInput_t")
        end select
    end function checkNumAsserts

    pure function checkNumFailingAsserts(example_result) result(result_)
        class(Input_t), intent(in) :: example_result
        type(Result_t) :: result_

        select type (example_result)
        type is (TestResultItemInput_t)
            result_ = assertEquals(0, example_result%input%numFailingAsserts())
        class default
            result_ = fail("Expected to get a TestResultItemInput_t")
        end select
    end function checkNumFailingAsserts
end module passing_case_test