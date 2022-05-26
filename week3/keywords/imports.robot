*** Settings ***
Library    SeleniumLibrary
# Keywords
Resource    ${CURDIR}/pages/home_page.robot
#Resource    ${CURDIR}/pages/search_page.robot
Resource    ${CURDIR}/common.robot
# test data
Variables    ${CURDIR}/resources/testdata/testdata.yaml