"use client";

import { InputDate } from "@/components/InputDate";
import React, { useRef, useState } from "react";
import { Box, Button, Grid2 } from "@mui/material";
import axios from "axios";
import { Transaction } from "@/models/transaction";

interface FormPageProps {
  setData: (data: Transaction[]) => void;
}

const FormPage: React.FC<FormPageProps> = ({ setData }) => {
  const [excelFile, setExcelFile] = useState<any>(null);
  const [dataFilter, setDataFilter] = useState<{
    fromDate?: string;
    toDate?: string;
  }>({});
  const inputFileRef = useRef<HTMLInputElement | null>(null);

  //create and function on click button tải file will click on input upload file
  const handleClick = () => {
    inputFileRef.current?.click();
  };

  const handleFileChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    const file = event.target.files?.[0];
    if (file) {
      setExcelFile(file); // Store the selected file
      sendFileToAPI(file); // Send the file to the backend API
    }
  };

  // Function to send file to backend API as multipart/form-data
  const sendFileToAPI = async (file: any) => {
    const formData = new FormData();
    formData.append("file", file); // Append the file to the FormData object

    try {
      const response = await axios.post(
        "http://localhost:8080/upload",
        formData,
        {
          headers: {
            "Content-Type": "multipart/form-data",
          },
        }
      );
      console.error("Upload file successfully ", response.data);
    } catch (error) {
      console.error("Error sending file to the backend:", error);
    }
  };

  const callAPIGetData = async () => {
    try {
      const response = await axios.get("http://localhost:8080/read-file", {
        params: dataFilter,
      });
      const data = (response.data as any[][]).map(
        (d) =>
          new Transaction(
            d[0],
            d[1],
            d[2],
            d[3],
            d[4],
            d[5],
            d[6],
            d[7],
            d[8],
            d[9],
            d[10],
            d[11],
            d[12],
            d[13],
            d[14],
            d[15],
            d[16]
          )
      );
      console.log(data);
      setData(data);
    } catch (error) {
      console.error("Error fetching data from the backend:", error);
    }
  };
  return (
    <div>
      <h1>Chi tiết doanh thu </h1>
      <form>
        <Grid2
          container
          direction={"row"}
          alignItems={"flex-end"}
          justifyContent={"flex-start"}
          mb={2}
        >
          <Grid2 size={6}>
            <InputDate label="Start Date" setDataFilter={setDataFilter} />
          </Grid2>
          <Grid2 size={2} display={"flex"} justifyContent={"center"}>
            <Button variant="outlined" onClick={callAPIGetData} size="large">
              Tìm kiếm
            </Button>
          </Grid2>
          <Grid2 size={2} display={"flex"} justifyContent={"center"}>
            <Button variant="contained" onClick={handleClick} size="large">
              Tải file
            </Button>
            <input
              ref={inputFileRef}
              type="file"
              accept=".xlsx, .xls"
              onChange={handleFileChange}
              hidden
            />
          </Grid2>
        </Grid2>
      </form>
    </div>
  );
};

export default FormPage;
