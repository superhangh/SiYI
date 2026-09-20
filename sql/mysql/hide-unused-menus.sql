-- 隐藏未使用的模块菜单（保留 system/infra/bpm/crm/mes）
-- 保留的顶级菜单 ID: 1(system) 2(infra) 148(bpm) 480(crm) 959(mes)
-- 需要隐藏的顶级菜单 ID: 114(pay) 207(report) 272(mp) 373(member) 449(mall) 597(erp) 791(ai) 860(iot) 1348(wms) 1418(im) 1476(hrm) 1637(cms) 1894(fms) 8000(pms) 8200(oa)

-- 创建临时表存储所有需要隐藏的菜单 ID（递归查找子菜单）
CREATE TEMPORARY TABLE temp_hide_menu_ids AS
WITH RECURSIVE menu_tree AS (
    SELECT id FROM system_menu
    WHERE id IN (114, 207, 272, 373, 449, 597, 791, 860, 1348, 1418, 1476, 1637, 1894, 8000, 8200)
    UNION ALL
    SELECT m.id FROM system_menu m
    INNER JOIN menu_tree t ON m.parent_id = t.id
)
SELECT id FROM menu_tree;

-- 软删除这些菜单（设置 deleted = 1）
UPDATE system_menu SET deleted = b'1' WHERE id IN (SELECT id FROM temp_hide_menu_ids);

-- 清理临时表
DROP TEMPORARY TABLE temp_hide_menu_ids;

-- 验证：查看剩余的顶级菜单
SELECT id, name, path FROM system_menu WHERE parent_id = 0 AND deleted = b'0' ORDER BY sort;
