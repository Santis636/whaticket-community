import { AllowNull, AutoIncrement, BelongsTo, Column, CreatedAt, DataType, Default, ForeignKey, Model, PrimaryKey, Table, UpdatedAt } from "sequelize-typescript";
import Company from "./Company";

@Table({

})
class License extends Model<License> {
    @PrimaryKey
    @AutoIncrement
    @Column
    id: number;

    @ForeignKey(() => Company)
    @AllowNull(false)
    @Column
    companyId: number;

    @BelongsTo(() => Company)
    company: Company;

    @Column
    type: string; // basic, pro, enterprise

    @Default("active")
    @Column(DataType.ENUM("active", "suspended", "expired"))
    status: string;

    @AllowNull(false)
    @Column
    startDate: Date;

    @Default(true)
    @Column
    isCurrent: boolean; //server para mostrar o estado da licensa ativa praticamente uma redundancia do bit de atividade

    @AllowNull(false)
    @Column
    endDate: Date;

    @Default(true)
    @Column
    active: boolean;

    @AllowNull(false)
    @Column
    createdBy: string;

    @CreatedAt
    createdAt: Date;
    
    @AllowNull(false)
    @Column
    updatedBy: string;

    @UpdatedAt
    updatedAt: Date;
}
export default License;