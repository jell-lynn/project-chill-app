# Sudoku

This is a Sudoku game programmed using Java and Swing for the GUI. It currently supports 6x6, 9x9, and 12x12 puzzles.

![screenshot](https://raw.githubusercontent.com/mattnenterprise/Sudoku/master/screenshot.png)

---

# Unit Test Explanation  
### Group 8 (2024-ITDS362-8)

## Member List:
- **6587037 Supisara Thonglerts**
- **6587057 Pradthana Supawong**
- **6587103 Supisara Ngamchaipisit**
- **6587106 Sitthida Srithanakrittathikarn**

---

# SudokuPuzzle Test Suites

## 1. Test Suite Name: `testGetNumRows()`

**Objective**: เพื่อตรวจสอบว่าฟังก์ชัน `getNumRows()` คืนค่าจำนวนแถวในเกม Sudoku ได้ถูกต้อง (ซึ่งควรเป็น 9)

### a. Identify testable functions:
- **Function Name**: `getNumRows()`

### b. Identify parameters, return types, return values, and exceptional behavior:
- **Parameters**: `Null`
- **Return Type**: `int`
- **Return Values**: `9` 
- **Exceptional behavior**: None expected.

### c. Model the input domain:

#### Characteristics for Input Space Partitioning

##### Interface-based characteristic : #####
| Characteristics       | b1  | b2   |
|-----------------------|-----|------|
| Number of rows        | = 9 | != 9 |

##### Functionality-based characteristic : #####
| Characteristics                   | b1   | b2   |
|-----------------------------------|------|------|
| Board is initialized correctly    | = 9  | != 9 |

### d. ISP Criteria 
#### Each Choice Coverage (ECC)
- **No. of test**: `2` (จำนวน Block ที่ใหญ่ที่สุด)
- **Test Value & Expected Result**:
  - `TEST_ECC_1_1`= { 9 }
  - `TEST_ECC_1_2`= { 8 }

| Test Case         | Number of rows   | Expected Result  | Status  |
|-------------------|------------------|------------------|---------|
| TEST_ECC_1_1      |         9        |         9        |   Pass  |
| TEST_ECC_1_2      |         8        |      Not  9      |   Pass  |
---

## 2. Test Suite Name: `testGetNumColumns()`

**Objective**: เพื่อตรวจสอบว่าฟังก์ชัน `getNumColumns()` คืนค่าจำนวนคอลัมน์ในเกม Sudoku ได้ถูกต้อง (ซึ่งควรเป็น 9)

### a. Identify testable functions:
- **Function Name**: `getNumColumns()`

### b. Identify parameters, return types, return values, and exceptional behavior:
- **Parameters**: `Null`
- **Return Type**: `int`
- **Return Values**: `9`
- **Exceptional behavior**: None expected.

### c. Model the input domain:

#### Characteristics for Input Space Partitioning

##### Interface-based characteristic : #####
| Characteristics       | b1   | b2   |
|-----------------------|------|------|
| Number of columns     | = 9  | != 9 |

##### Functionality-based characteristic : #####
| Characteristics                   | b1   | b2   |
|-----------------------------------|------|------|
| Board is initialized correctly    | = 9  | != 9 |

### d. ISP Criteria 
#### Each Choice Coverage (ECC)
- **No. of test**: `2` (จำนวน Block ที่ใหญ่ที่สุด)
- **Test Value & Expected Result**:
  - `TEST_ECC_2_1` = { 9 }
  - `TEST_ECC_2_2` = { 8 }

| Test Case         | Number of columns   | Expected Result  | Status  |
|-------------------|---------------------|------------------|---------|
| TEST_ECC_2_1      |           9         |         9        |   Pass  |
| TEST_ECC_2_2      |           8         |      Not 9      |   Pass  |

---

## 3. Test Suite Name: `testGetBoxWidth()`

**Objective**: เพื่อตรวจสอบว่าฟังก์ชัน `getBoxWidth()` คืนค่าความกว้างของกล่องใน Sudoku ได้ถูกต้อง (ซึ่งควรเป็น 3)

### a. Identify testable functions:
- **Function Name**: `getBoxWidth()`

### b. Identify parameters, return types, return values, and exceptional behavior:
- **Parameters**: `Null`
- **Return Type**: `int`
- **Return Values**: `3`
- **Exceptional behavior**: None expected.

### c. Model the input domain:

#### Characteristics for Input Space Partitioning

##### Interface-based characteristic : #####
| Characteristics       | b1   | b2   |
|-----------------------|------|------|
| Box width             | = 3  | != 3 |

##### Functionality-based characteristic : #####
| Characteristics                   | b1   | b2   |
|-----------------------------------|------|------|
| Board is initialized correctly    | = 3  | != 3 |

### d. ISP Criteria 
#### Based Choice Coverage (BCC)
- **No. of test**: `2`
- **Test Value & Expected Result**:
  - `TEST_BCC_1_1` = { 3 }
  - `TEST_BCC_1_2` = { 2 }

| Test Case         |     Box width    | Expected Result  | Status  |
|-------------------|------------------|------------------|---------|
| TEST_BCC_1_1      |         3        |         3        |   Pass  |
| TEST_BCC_1_2      |         2        |       Not 3      |   Pass  |
---

## 4. Test Suite Name: `testGetBoxHeight()`

**Objective**: เพื่อตรวจสอบว่าฟังก์ชัน `getBoxHeight()` คืนค่าความสูงของกล่องใน Sudoku ได้ถูกต้อง (ซึ่งควรเป็น 3)

### a. Identify testable functions:
- **Function Name**: `getBoxHeight()`

### b. Identify parameters, return types, return values, and exceptional behavior:
- **Parameters**: `Null`
- **Return Type**: `int`
- **Return Values**: `3`
- **Exceptional behavior**: None expected.

### c. Model the input domain:

#### Characteristics for Input Space Partitioning

##### Interface-based characteristic : #####
| Characteristics       | b1   | b2   |
|-----------------------|------|------|
| Box height            | = 3  | != 3 |

##### Functionality-based characteristic : #####
| Characteristics                   | b1   | b2   |
|-----------------------------------|------|------|
| Board is initialized correctly    | = 3  | != 3 |

### d. ISP Criteria 
#### Based Choice Coverage (BCC)
- **No. of test**: `2`
- **Test Value & Expected Result**:
  - `TEST_BCC_2_1` = { 3 }
  - `TEST_BCC_2_2` = { 2 }

| Test Case         |    Box height    | Expected Result  | Status  |
|-------------------|------------------|------------------|---------|
| TEST_BCC_2_1      |         3        |         3        |   Pass  |
| TEST_BCC_2_2      |         2        |      Not 3       |   Pass  |

---

## 5. Test Suite Name: `testGetValidValues()`

**Objective**: เพื่อตรวจสอบว่าฟังก์ชัน `getValidValues()` คืนค่าที่เป็นไปได้ (ซึ่งควรเป็น `1-9`)

### a. Identify testable functions:
- **Function Name**: `getValidValues()`

### b. Identify parameters, return types, return values, and exceptional behavior:
- **Parameters**: `Null`
- **Return Type**: `String[]`
- **Return Values**: `["1", "2", "3", "4", "5", "6", "7", "8", "9"]`
- **Exceptional behavior**: None expected.

### c. Model the input domain:

#### Characteristics for Input Space Partitioning

##### Interface-based characteristic : #####
| Characteristics       | b1   | b2   |
|-----------------------|------|------|
| Valid values          | Contains 1-9  | Does not contain 1-9 |

##### Functionality-based characteristic : #####
| Characteristics                        | b1            | b2                   |
|----------------------------------------|---------------|----------------------|
| Valid values are initialized correctly | Contains 1-9  | Does not contain 1-9 |

### d. ISP Criteria 
#### Model-Based Choice Coverage (MBCC)
- **No. of test**: `2`
- **Test Value & Expected Result**:
  - `TEST_MBCC_1_1`: { new String[]{"1", "2", "3", "4", "5", "6", "7", "8", "9"} }
  - `TEST_MBCC_1_1`: { "0" }

| Test Case         |   Valid values   | Expected Result  | Status  |
|-------------------|------------------|------------------|---------|
| TEST_MBCC_1_1     |{"1", "2", "3", "4", "5", "6", "7", "8", "9"}|Array is valid; contain 1-9 |   Pass  |
| TEST_MBCC_1_1     |{"0"}|Should fail or ensure the array does not contain "0"|   Pass  |
---

## 6. Test Suite Name: `testMakeValidMove()`

**Objective**: เพื่อตรวจสอบว่าฟังก์ชัน `makeMove(int row, int col, String value, boolean isMutable)` สามารถทำการเคลื่อนไหวที่ถูกต้องได้

### a. Identify testable functions:
- **Function Name**: `makeMove(int row, int col, String value, boolean isMutable)`

### b. Identify parameters, return types, return values, and exceptional behavior:
- **Parameters**: `row`, `col`, `value`, `isMutable`
- **Return Type**: `void`
- **Return Values**: None
- **Exceptional behavior**: Throws an error if the move is invalid.

### c. Model the input domain:

#### Characteristics for Input Space Partitioning

##### Interface-based characteristic : #####
| Characteristics       | b1   | b2    |
|-----------------------|------|-------|
| Mutable slot          | true | false |

##### Functionality-based characteristic : #####
| Characteristics       | b1                        | b2                              |
|-----------------------|---------------------------|---------------------------------|
| Valid move            | Valid value in empty slot | Invalid value in non-empty slot |

### d. ISP Criteria 
#### All Combinations of Choice (ACoC)
- **No. of test**: `2`(จำนวน Block ทั้งหมด)
- **Test Value & Expected Result**:
  - `TEST_ACoC_1_1`: { (0, 2, "5", false) : "5" }
  - `TEST_ACoC_1_2`: { (0, 2, "3", true) : "5" }

| Test Case         | row | col | value | isMutable | Current Value | Expected Result  | Status  |
|-------------------|-----|-----|-------|-----------|---------------|------------------|---------|
| TEST_ACoC_1_1     |  0  |  2  |  "5"  |    false  |     Empty     |The cell at (0, 2) is "5".|  Pass  |
| TEST_ACoC_1_2     |  0  |  2  |  "3"  |    true   |      "5"      |The cell remains "5".|  Pass  |
---

## 7. Test Suite Name: `testIsValidMove()`

**Objective**: ตรวจสอบการทำงานของฟังก์ชัน `isValidMove(int row, int col, String value)` ว่าเคลื่อนไหวได้ถูกต้อง (ตรวจสอบว่าค่าที่วางนั้นถูกต้อง ไม่ซ้ำในrow, col และกล่อง)

### a. Identify testable functions:
- **Function Name**: `isValidMove(int row, int col, String value)`

### b. Identify parameters, return types, return values, and exceptional behavior:
- **Parameters**: `row`, `col`, `value`
- **Return Type**: `boolean`
- **Return Values**: `true` or `false`
- **Exceptional behavior**: None expected.

### c. Model the input domain:

#### Characteristics for Input Space Partitioning

##### Interface-based characteristic : #####
| Characteristics       | b1   | b2    |
|-----------------------|------|-------|
| Value in range        | true | false |

##### Functionality-based characteristic : #####
| Characteristics                   | b1   | b2    |
|-----------------------------------|------|-------|
| Move is valid                     | true | false |

### d. ISP Criteria 
#### All Combinations of Choice (ACoC)
- **No. of test**: `2`(จำนวน Block ทั้งหมด)
- **Test Value & Expected Result**:
  - `TEST_ACoC_2_1`: { (0, 2, "5") : true }
  - `TEST_ACoC_2_2`: { (0, 2, "6") : false }

| Test Case         | row | col | value | isMutable | Move Validity | Expected Result  | Status  |
|-------------------|-----|-----|-------|-----------|---------------|------------------|---------|
| TEST_ACoC_2_1     |  0  |  2  |  "5"  |    true   |     true      |       true       |  Pass   |
| TEST_ACoC_2_2     |  0  |  2  |  "6"  |    true   |     false     |       false      |  Pass   |
---

## 8. Test Suite Name: `testIsSlotAvailable()`

**Objective**: เพื่อตรวจสอบการทำงานของฟังก์ชัน `isSlotAvailable(int row, int col)` ว่าช่องว่างอยู่หรือไม่

### a. Identify testable functions:
- **Function Name**: `isSlotAvailable(int row, int col)`

### b. Identify parameters, return types, return values, and exceptional behavior:
- **Parameters**: `row`, `col`
- **Return Type**: `boolean`
- **Return Values**: `true` (empty) or `false` (occupied)
- **Exceptional behavior**: None expected.

### c. Model the input domain:

#### Characteristics for Input Space Partitioning

##### Interface-based characteristic : #####
| Characteristics       | b1    | b2       |
|-----------------------|-------|----------|
| Slot status           | empty | occupied |

##### Functionality-based characteristic : #####
| Characteristics                   | b1   | b2    | 
|-----------------------------------|------|-------|
| Slot is checked                   | true | false |

### d. ISP Criteria 
#### Pairwise Coverage (PWC)
- **No. of test**: `2`
- **Test Value & Expected Result**:
  - `TEST_PWC_1_1`: { (0, 2) : true}
  - `TEST_PWC_1_2`: { (0, 2) : false}

| Test Case         | row | col | value | Slot Status | Expected Result  | Status  |
|-------------------|-----|-----|-------|-------------|------------------|---------|
| TEST_ACoC_2_1     |  0  |  2  |       |    Empty    |       true       |  Pass   |
| TEST_ACoC_2_2     |  0  |  2  |  "5"  |   Occupied  |       false      |  Pass   |
---

## 9. Test Suite Name: `testBoardFull()`

**Objective**:  เพื่อตรวจสอบการทำงานของฟังก์ชัน `boardFull()` ว่ากระดาน Sudoku ได้รับการเติมครบถ้วนหรือไม่ (กระดาน Sudoku ไม่มีที่ว่าง)

### a. Identify testable functions:
- **Function Name**: `boardFull()`

### b. Identify parameters, return types, return values, and exceptional behavior:
- **Parameters**: `Null`
- **Return Type**: `boolean`
- **Return Values**: `true` (full) or `false` (not full)
- **Exceptional behavior**: None expected.

### c. Model the input domain:

#### Characteristics for Input Space Partitioning

##### Interface-based characteristic : #####
| Characteristics       | b1    | b2       |
|-----------------------|-------|----------|
| Board status          | full  | not full |

##### Functionality-based characteristic : #####
| Characteristics                   | b1   | b2    |
|-----------------------------------|------|-------|
| Check if board is full            | true | false |

### d. ISP Criteria 
#### Pairwise Coverage (PWC)
- **No. of test**: `2`
- **Test Value & Expected Result**:
  - `TEST_PWC_2_1`: { true }
  - `TEST_PWC_2_2`: { false }

| Test Case         | Board status | Check Board Full | Expected Result  | Status  |
|-------------------|--------------|------------------|------------------|---------|
| TEST_PWC_2_1      |     Full     |       true       |       true       |  Pass   |
| TEST_PWC_2_1      |   Not Full   |       false      |       false      |  Pass   |
---

## 10. Test Suite Name: `testGetValue()`

**Objective**: เพื่อตรวจสอบว่าฟังก์ชัน `getValue(int row, int col)`  คืนค่าภายในช่อง Sudoku ได้ถูกต้อง

### a. Identify testable functions:
- **Function Name**: `getValue(int row, int col)`

### b. Identify parameters, return types, return values, and exceptional behavior:
- **Parameters**: `row`, `col`
- **Return Type**: `String`
- **Return Values**: The value at the specified row and column.
- **Exceptional behavior**: Throws an error if indices are out of bounds.

### c. Model the input domain:

#### Characteristics for Input Space Partitioning

##### Interface-based characteristic : #####
| Characteristics       | b1   | b2    |
|-----------------------|------|-------|
| Valid indices         | true | false |

##### Functionality-based characteristic : #####
| Characteristics                   | b1    | b2      |
|-----------------------------------|-------|---------|
| Retrieve value                    | valid | invalid |

### d. ISP Criteria 
#### Model-Based Choice Coverage (MBCC)
- **No. of test**: `2`
- **Test Value & Expected Result**:
  - `TEST_MBCC_2_1`: { (0,0) : "6" }
  - `TEST_MBCC_2_2`: { (0,0) : "7" }

| Test Case         | Valid Indices | Retrieve Value | Expected Result  | Status  |
|-------------------|---------------|----------------|------------------|---------|
| TEST_MBCC_2_1     |     true      |     valid      |       "6"        |  Pass   |
| TEST_MBCC_2_2     |     false     |    invalid     |     Not "6"      |  Pass   |
---