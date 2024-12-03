package uz.pdp.demo12.test;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReportData {

    private String country;
    private Long regionCount;

}
